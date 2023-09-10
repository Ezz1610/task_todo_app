import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_todo_app/data/model/user_model.dart';
import 'package:task_todo_app/domain/usecases/get_todo_usecase.dart';

import '../../data/datasource/remote_data_source.dart';
import '../../data/model/todo_model.dart';
import '../../data/repository/home_repository_imp.dart';
import '../../domain/repository/base_home_repository.dart';
import '../../domain/usecases/get_user_usecase.dart';

part 'todo_app_state.dart';

class HomeAppCubit extends Cubit<HomeAppState> {
  HomeAppCubit() : super(HomeAppInitial());
  static HomeAppCubit get(BuildContext context)=>BlocProvider.of(context);
  List<TodoModel>todos=[];
 Future<void> getTodos()async{
   BaseRemoteDataSource baseRemoteDataSource=RemoteDataSource();
   BaseHomeRepository baseHomeRepository=HomeRepository(baseRemoteDataSource);
    todos= (await GetTodoUseCase(baseHomeRepository).execute())!;
   emit(TodoAppLoading());

   if(todos.isNotEmpty){
     print("todos is Not Empty ");
     emit(TodoAppSuccess());
   }else{
     print("todos is Empty ");
     emit(TodoAppError());
   }
 }
  List<UserModel>users=[];
 Future<void> getUsers()async{
   BaseRemoteDataSource baseRemoteDataSource=RemoteDataSource();
   BaseHomeRepository baseHomeRepository=HomeRepository(baseRemoteDataSource);
    users= (await GetUserUseCase(baseHomeRepository).execute())!;
   emit(UserAppLoading());

   if(users.isNotEmpty){
     print("users is Not Empty ");
     emit(UserAppSuccess());
   }else{
     print("users is Empty ");
     emit(UserAppError());
   }
 }

}
