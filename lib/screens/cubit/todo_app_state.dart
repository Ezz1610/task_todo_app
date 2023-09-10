part of 'todo_app_cubit.dart';

@immutable
abstract class HomeAppState {}

class HomeAppInitial extends HomeAppState {}
class TodoAppLoading extends HomeAppState {}
class TodoAppSuccess extends HomeAppState {}
class TodoAppError extends HomeAppState {}
class UserAppLoading extends HomeAppState {}
class UserAppSuccess extends HomeAppState {}
class UserAppError extends HomeAppState {}

