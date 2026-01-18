import 'package:mypetjoyy/features/auth/domain/entities/auth_entity.dart';

class AuthApiModel {
  final String? id;
  final String fullName;
  final String email;
  final String? profilePicture;

  AuthApiModel({
    this.id,
    required this.fullName,
    required this.email,
    this.profilePicture,
  });

  Map<String, dynamic> toRegisterJson() {
    return {'fullName': fullName, 'email': email, 'password': null};
  }

  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'] as Map<String, dynamic>? ?? json;

    return AuthApiModel(
      id: userData['_id']?.toString() ?? userData['id']?.toString(),
      fullName: (userData['fullName'] ?? '') as String,
      email: (userData['email'] ?? '') as String,
      profilePicture: userData['profilePicture']?.toString(),
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      authId: id,
      fullName: fullName,
      email: email,
      profilePicture: profilePicture,
    );
  }

  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      id: entity.authId,
      fullName: entity.fullName,
      email: entity.email,
      profilePicture: entity.profilePicture,
    );
  }
}
