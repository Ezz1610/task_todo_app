import 'package:dio/dio.dart';
import 'package:task_todo_app/domain/entities/todo_entity.dart';
class TodoListModel{
 final List<TodoModel> listTodo=[];
  TodoListModel.fromJson(List<dynamic> response){
    listTodo.clear();
    response.map((e){
      listTodo.add(e);
    });
  }
}
class TodoModel extends TodoEntity{
  TodoModel(
       super.userId,
      super.id,
      super.title,
      super.completed
      );
  factory TodoModel.fromJson(Map<String,dynamic>json)=>TodoModel(
        json["userId"],
        json["id"],
        json["title"],
        json["completed"],
      );

}
