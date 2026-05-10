import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_application/Components/button.dart';
import 'package:travel_application/Components/custom_text_field.dart';
import 'package:travel_application/models/user.dart';
import 'package:travel_application/providers/user_profile_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _nameController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _isUploadingImage = false;

  @override
  void dispose() {
    _nameController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  ImageProvider _getProfileImage(String? path) {
    if (path == null || path.trim().isEmpty) {
      return const AssetImage('assets/images/user_profile.jpg');
    }

    if (path.startsWith('http://') || path.startsWith('https://')) {
      return NetworkImage(path);
    }

    return AssetImage(path);
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(userProfileDataProvider);

    ref.listen<AsyncValue<UserModel?>>(
      userProfileDataProvider,
      (previous, next) {
        final user = next.value;
        if (user != null && _nameController.text.isEmpty) {
          _nameController.text = user.name;
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: profileState.when(
        loading: () =>
            const Center(child: CircularProgressIndicator(color: Colors.black)),
        error: (error, stack) =>
            Center(child: Text("Error loading profile: $error")),
        data: (user) {
          if (user == null) {
            return const Center(child: Text("User data not found."));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Profile Picture Section ---
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                            image: DecorationImage(
                              image: _getProfileImage(user.imagePath),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.black12, width: 2),
                          ),
                        ),

                        if (_isUploadingImage)
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            ),
                          ),

                        // Camera Icon / Button එක
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _isUploadingImage
                                ? null
                                : _handleProfileImageUpdate,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 3),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  Center(
                    child: Text(
                      user.email,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // --- Personal Info Section ---
                  const Text(
                    "Personal Info",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    labelText: 'Full Name',
                    controller: _nameController,
                    prefixIcon: Icons.person_outline,
                    keyboardType: TextInputType.name,
                  ),

                  const SizedBox(height: 30),

                  // --- Password Change Section ---
                  const Text(
                    "Change Password",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    labelText: 'Current Password',
                    controller: _currentPasswordController,
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    labelText: 'New Password',
                    controller: _newPasswordController,
                    prefixIcon: Icons.lock_reset,
                    isPassword: true,
                  ),

                  const SizedBox(height: 40),

                  // --- Save Changes Button ---
                  CustomButton(
                    title: _isLoading ? 'Saving...' : 'Save Changes',
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white,
                    onPressed: null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _handleProfileImageUpdate() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (pickedFile == null) return;

      setState(() {
        _isUploadingImage = true;
      });

      final imageFile = File(pickedFile.path);

      final userService = ref.read(profileServiceProvider);

      await userService.uploadProfilePicture(imageFile);

      ref.invalidate(userProfileDataProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Profile picture updated successfully!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploadingImage = false;
        });
      }
    }
  }
}
