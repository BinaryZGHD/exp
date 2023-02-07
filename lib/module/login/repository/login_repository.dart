
import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../utils/dio.dart';

class LoginRepository {

  Future<Response> getScreenLogin() async {
    return await MyDio.createDioServer().post("/v1/api/modules/login/wording/login",
        data: jsonEncode({}) //for post
    );
  }

}
