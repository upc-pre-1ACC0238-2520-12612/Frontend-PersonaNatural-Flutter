import '../domain/user_entity.dart';

class AuthRepository {
  // Simula una base de datos en memoria
  static final List<UserEntity> _users = [];

  // Simula un inicio de sesión
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800)); // Simula retardo de red
    return _users.any((user) => user.email == email && user.password == password);
  }

  // Simula el registro
  Future<void> register(UserEntity user) async {
    await Future.delayed(const Duration(milliseconds: 800));
    _users.add(user);
  }

  // Obtener usuario (para mostrar info si deseas)
  UserEntity? getUser(String email) {
    try {
      return _users.firstWhere((u) => u.email == email);
    } catch (_) {
      return null;
    }
  }

  // Cerrar sesión (si quisieras manejar estado)
  void logout() {}
}
