import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> getProfileData(String userId) async {
    try {
      final data = await _supabase
          .from('profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();
      return data;
    } catch (e) {
      print("ProfileService Error: $e");
      return null;
    }
  }

  User? get currentUser => _supabase.auth.currentUser;

Future<String> uploadProfilePicture(File imageFile) async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) {
        throw 'User is not logged in.';
      }

      final userId = user.id;
      final fileExtension = imageFile.path.split('.').last;
      final fileName = '${userId}_${DateTime.now().millisecondsSinceEpoch}.$fileExtension';

      await _supabase.storage.from('avatars').upload(
        fileName,
        imageFile,
        fileOptions: const FileOptions(upsert: true),
      );

      final imageUrl = _supabase.storage.from('avatars').getPublicUrl(fileName);

      await _supabase.from('profiles').update({
        'avatar_url': imageUrl,
      }).eq('id', userId);

      return imageUrl;
      
    } catch (e) {
      throw 'Failed to upload profile picture: $e';
    }
  }
}