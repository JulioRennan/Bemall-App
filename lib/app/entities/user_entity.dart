import 'dart:convert';

import 'package:bemall_app/app/entities/address_entity.dart';

class UserEntity {
  int id;
  String name;
  String email;
  List<AddressEntity> address;

  factory UserEntity.empty() {
    return UserEntity(id: -1, name: '', email: '', address: []);
  }

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address.map((x) => x.toMap()).toList(),
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] != null
          ? List<AddressEntity>.from(
              map['address']?.map((x) => AddressEntity.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source));
}
