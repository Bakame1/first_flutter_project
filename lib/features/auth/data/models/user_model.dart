import 'package:first_flutter_project/core/common/entities/user.dart';

class UserModel extends User{
  UserModel({
    required super.id,
    required super.email,
    required super.name
  });

  factory UserModel.fromJson(Map<String,dynamic> map){
    return UserModel(
      id: map['id'] ?? '',//in case it is null
      email: map['email'] ?? '',//in case it is null
      name: map['name'] ?? '',//in case it is null
    );
  }
  UserModel copyWith({
    String? id,
    String? email,
    String? name,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

}