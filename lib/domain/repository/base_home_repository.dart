
import 'package:task_todo_app/data/model/todo_model.dart';
import 'package:task_todo_app/data/model/user_model.dart';

abstract class BaseHomeRepository{
  Future<List<TodoModel>?>  getTodos();
  Future<List<UserModel>?>  getUsers();
}