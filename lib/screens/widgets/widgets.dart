import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_todo_app/data/model/todo_model.dart';
import 'package:task_todo_app/data/model/user_model.dart';

import '../../shard/colors.dart';
import '../../shard/components.dart';
Widget headItemTodo()=>const Row(
  children: [
    Expanded(
      flex: 1,
      child: Row(
        children: [
          Text("TODO",style: TextStyle(color: Colors.white),),

        ],),
    ),
    Expanded(
      flex: 3,
      child: Row(children: [
        Expanded(child: Text("PERMISSIONS",style: TextStyle(color: Colors.white),)),
        Expanded(child: Text("USER RIGHTS",style: TextStyle(color: Colors.white),)),
        Expanded(child: Text("PERIOD",style: TextStyle(color: Colors.white),)),
      ],),
    )

  ],
);
Widget itemTodo(TodoModel todoModel)=>Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      flex: 1,
      child: Text("${todoModel.id}",style: const TextStyle(color: Colors.white),),
    ),
    Expanded(
      flex: 3,
      child: Row(children: [
        Container(
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(5),

          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${todoModel.completed}",style: const TextStyle(color: Colors.white),),
              const Icon(Icons.arrow_drop_down_outlined,color: Colors.white,)
            ],),),
        const SizedBox(width: 20,),
        Container(
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(5),

          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("title",style: TextStyle(color: Colors.white),),
            ],),),
        const SizedBox(width: 20,),
        const Icon(Icons.edit,color: Colors.white,),
        const SizedBox(width: 5,),
        const Icon(Icons.add,color: Colors.white,),
        const SizedBox(width: 5,),
        const Icon(Icons.delete,color: Colors.white,),
        //01019879413

      ],),
    ),
  ],);
Widget buildListItemTodo(List<TodoModel> todos)=>Expanded(
  child:   ListView.separated(
  
  
  
      shrinkWrap: true,
  
      itemBuilder: (context,index)=> itemTodo(todos[index]),
  
      separatorBuilder: (context,index)=>const SizedBox(height: 3,),
  
      itemCount: todos.length),
);
Widget buildItemTodo(List<TodoModel> todos)=>Container(
    height: 200,
    width: 500,
    padding: const EdgeInsets.only(top: 10,left: 10),
    decoration: BoxDecoration(color: AppColors.myColorItem),
    child: Column(
      children: [
      headItemTodo(),
      myDivider(),
      const SizedBox(height: 20,),
      buildListItemTodo(todos),

    ],)
);
Widget buildItemUser(UserModel userModel)=>Container(
  padding: const EdgeInsets.only(left: 10,top: 10),
  height: 150,
  width: 250,
  decoration:  BoxDecoration(
    color: AppColors.myColorItem,
    borderRadius: BorderRadius.circular(10),
  ),
  child:  Column(children: [
    Row(children: [
      const CircleAvatar(
        radius: 30.0,
        backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with your image asset path
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userModel.name,style: const TextStyle(color: Colors.white),),
            Text(userModel.username,style: const TextStyle(color: Colors.white54),),

          ],),
      ),

    ],),
    const SizedBox(height: 20,),
    Row(children: [
      SizedBox(width:160,child: Text(userModel.email,style: const TextStyle(color: Colors.white54,),overflow: TextOverflow.ellipsis,maxLines: 1,)),
      const SizedBox(width: 12.0),
      const Icon(Icons.email, color: Colors.white),
      const SizedBox(width: 12.0),
      const Icon(Icons.phone, color: Colors.white),

    ],)
  ],),
);
Widget homeItem(List<TodoModel> todos,UserModel userModel)=>Padding(
  padding: const EdgeInsets.only(left: 15,top: 15),
  child: Row(
    children: [
      buildItemUser(userModel),
      Container(width: 10,height: 5,color:AppColors.myColorItem ,),
      buildItemTodo(todos)
    ],),
);
Widget buildHomeItem(List<TodoModel> todos,List<UserModel> users) {
  // int i=0;
  // for( i;i<users.length;i++){
  //   subTodoList =todos.where((todo) => todo.userId==users[i].id).toList();
  //
  // }
  // print("iiiiiiiiiiiiiiiii${users[i].id}");
  // print("lllllllllllllllll${subTodoList.length}");
  // return homeItem(subTodoList,users[i]);


  return ListView.separated(
    shrinkWrap: true,
    itemBuilder: (context,index){
      List<TodoModel> subTodoList=[];
      subTodoList.clear();
        subTodoList = todos.where((todo) => todo.userId==users[index].id).toList();
        const Duration(seconds: 1);
        Completer();
      print("iiiiiiiiiiiiiiiii${users[index].id}");
      print("lllllllllllllllll${subTodoList.length}");
      return homeItem(subTodoList,users[index]);




    },
    separatorBuilder:(context,index)=> SizedBox(height: 2,),
    itemCount:users.length);
}
