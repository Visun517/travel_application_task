class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String avatarUrl;

  UserProfile({required this.id, required this.fullName, required this.email, required this.avatarUrl});

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] ?? '',
      fullName: map['full_name'] ?? 'Traveler',
      email: map['email'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
    );
  }
}