import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/models/user.dart';
import 'package:travel_application/services/userService.dart';

final profileServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

final userProfileDataProvider = FutureProvider<UserModel?>((ref) async {
  final userService = ref.watch(profileServiceProvider); 
  final user = userService.currentUser;

  if (user == null) return null;

  final data = await userService.getProfileData(user.id);

  if (data != null) {
    return UserModel.fromMap(data); 
  }

  return null;
});