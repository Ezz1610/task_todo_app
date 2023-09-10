import 'package:task_todo_app/data/model/user_model.dart';
import 'package:task_todo_app/shard/constants.dart';
import '../model/todo_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSource{
  Future<List<TodoModel>?> getTodos();
  Future<List<UserModel>?> getUsers();

}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<List<TodoModel>?> getTodos()async {

try{
  final dio = Dio();
  Response response = await dio.get(AppConstants.todosUrl);
  // print("response is : ${response}");

  List<dynamic> res=response.data;
  // print("res is : ${res}");
  List<TodoModel> todos= res.map((e) => TodoModel.fromJson(e)).toList();
  // print("todos is : ${todos}");
  // print("todos length is : ${todos.length}");
  return todos;
} catch(e){
  print("error is :$e");
  return (null);

}


  }

  @override
  Future<List<UserModel>?> getUsers() async{

    try{
      final dio = Dio();
      Response response = await dio.get(AppConstants.usersUrl);
      print("response is : ${response}");

      List<dynamic> res=response.data;
      print("res is : ${res}");
      List<UserModel> users= res.map((e) => UserModel.fromJson(e)).toList();
      print("users is : ${users}");
      print("users length is : ${users.length}");
      return users??[];
    } catch(e){
      print("error is :$e");
      return (null);

    }

  }

}