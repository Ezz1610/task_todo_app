
import 'package:task_todo_app/data/model/todo_model.dart';

import '../../data/model/user_model.dart';
import '../entities/todo_entity.dart';
import '../repository/base_home_repository.dart';

class GetUserUseCase{
final BaseHomeRepository repository;
GetUserUseCase(this.repository);

Future<List<UserModel>?>execute() async{
    // add cityName to parameter of getUser(cityName) in BaseUserRepository
    return await repository.getUsers();
  }
}