import 'package:dio/dio.dart';
import 'package:task_todo_app/domain/entities/todo_entity.dart';

import '../../domain/entities/users_entity.dart';

class UserModel extends UserEntity{
  UserModel(
      super.id,
      super.name,
      super.username,
      super.email

      );
  factory UserModel.fromJson(Map<String,dynamic>json)=>UserModel(
        json["id"],
        json["name"],
        json["username"],
        json["email"],
      );

}
