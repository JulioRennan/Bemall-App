import 'dart:convert';

import 'package:bemall_app/app/entities/user_entity.dart';

class UserTokenEntity {
  UserEntity? user;
  String token;

  UserTokenEntity({
    required this.user,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'token': token,
    };
  }

  factory UserTokenEntity.fromMap(Map<String, dynamic> map) {
    return UserTokenEntity(
      user: map['user'] != null ? UserEntity.fromMap(map['user']) : null,
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTokenEntity.fromJson(String source) =>
      UserTokenEntity.fromMap(json.decode(source));
}
