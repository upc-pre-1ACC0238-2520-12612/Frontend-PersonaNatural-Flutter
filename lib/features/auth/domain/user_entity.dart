class UserEntity {
  final String name;
  final String email;
  final String password;
  final String userType; // "Persona natural" o "Empresa"

  UserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });
}
