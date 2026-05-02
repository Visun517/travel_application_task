import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';

final userProfileProvider = FutureProvider<UserProfile?>((ref) async {
  final supabase = Supabase.instance.client;

  final user = supabase.auth.currentUser;

  if (user == null) return null;
  await Future.delayed(const Duration(milliseconds: 500));

  final data = await supabase
      .from('profiles')
      .select()
      .eq('id', user.id)
      .maybeSingle();
      
  return data != null ? UserProfile.fromMap(data) : null;
});
