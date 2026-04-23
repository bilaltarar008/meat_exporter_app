enum UserRole {
  owner,
  slaughterhouse,
  warehouse,
}

class User {
  final String id;
  final String name;
  final UserRole role;

  User({
    required this.id,
    required this.name,
    required this.role,
  });
}