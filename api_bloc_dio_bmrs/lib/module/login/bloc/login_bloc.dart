import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_screen_response.dart';
import '../repository/login_repository.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>  with LoginRepository {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginScreenEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        if (kDebugMode) {
          print("Step   1 :  LoginLoading");
        }
        Response getLoginScreenResponse = await getScreenLogin();
        if (kDebugMode) {
          print("Step   2 :  getScreenLogin");
        }
        emit(LoginEndLoading());
        if (kDebugMode) {
          print("Step   3 :  LoginEndLoading");
        }
        if (getLoginScreenResponse.statusCode == 200) {
          LoginScreenResponse screenLoginResponse = LoginScreenResponse.fromJson(getLoginScreenResponse.data);
          if (kDebugMode) {
            print("Step   4 :  statusCode == 200");
          }
          if (screenLoginResponse.head?.status == "200") {
            if (kDebugMode) {
              print("Step   5 :  status == 200");
            }
            emit(LoginScreenState( responseLoginScreen: screenLoginResponse));
            if (kDebugMode) {
              print("Step   6 : responseScreenInfoLogin");
            }
          } else {
            emit(LoginError(message: screenLoginResponse.head?.message?? ""));
            if (kDebugMode) {
              print("Step   7 : LoginError  screenLoginResponse");
            }
          }
        } else {
          emit(LoginError(message: getLoginScreenResponse.statusMessage ?? ""));
          if (kDebugMode) {
            print("Step   8 : LoginError  message");
          }
        }
      }
      on DioError catch (e) {
        emit(LoginError(message: e.response?.statusMessage ?? ""));
        if (kDebugMode) {
          print("Step   9 : catch  message");
          print(e.response?.statusMessage ?? "");
        }
      }
    });
  }
}
