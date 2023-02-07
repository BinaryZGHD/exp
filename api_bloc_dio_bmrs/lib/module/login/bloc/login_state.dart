part of 'login_bloc.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginEndLoading extends LoginState {}

class LoginError extends LoginState {
  String message;
  LoginError({required this.message});
}
class LoginScreenState extends LoginState {
  LoginScreenResponse responseLoginScreen;

  LoginScreenState({required this.responseLoginScreen});
}