import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_todo_app/screens/widgets/widgets.dart';
import '../shard/colors.dart';
import 'cubit/todo_app_cubit.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState(){
    HomeAppCubit.get(context).getTodos();
    HomeAppCubit.get(context).getUsers();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
var cubit=HomeAppCubit.get(context);
    return  Scaffold(
      backgroundColor: AppColors.mainColor,
      body:  BlocBuilder<HomeAppCubit,HomeAppState>(

          builder: (BuildContext context, state) {
            if(state is UserAppSuccess )
             {
               print("length todos from cubit is ${cubit.todos.length}");
               print("length users from cubit is ${cubit.users.length}");
               return buildHomeItem(cubit.todos,cubit.users);
             }
            else{
           return  const Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Center(child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),),
             ],
           );
            }
            },
       ),
    );
  }
}
