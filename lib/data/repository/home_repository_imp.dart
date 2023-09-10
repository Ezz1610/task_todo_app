
import 'package:task_todo_app/data/model/todo_model.dart';
import 'package:task_todo_app/data/model/user_model.dart';

import '../../domain/repository/base_home_repository.dart';
import '../datasource/remote_data_source.dart';


class HomeRepository implements BaseHomeRepository{
 final BaseRemoteDataSource baseRemoteDataSource;
 HomeRepository(this.baseRemoteDataSource);
  @override
  Future<List<TodoModel>?> getTodos()async {
    return (await baseRemoteDataSource.getTodos())!;
  }

  @override
  Future<List<UserModel>?> getUsers() async{
   return (await baseRemoteDataSource.getUsers())!;
  }

}
