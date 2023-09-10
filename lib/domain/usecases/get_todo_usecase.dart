
import 'package:task_todo_app/data/model/todo_model.dart';

import '../entities/todo_entity.dart';
import '../repository/base_home_repository.dart';

class GetTodoUseCase{
final BaseHomeRepository repository;
GetTodoUseCase(this.repository);

Future<List<TodoModel>?>execute() async{
    // add cityName to parameter of getTodo(cityName) in BaseTodoRepository
    return await repository.getTodos();
  }
}