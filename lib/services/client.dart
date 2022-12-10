import 'dart:convert';
import 'package:http/http.dart' as http;

import '../json/jsonClasses.dart';

class AuthClient {
  var client = http.Client();
  var baseUrl = 'http://178.128.63.131:3001';

  //post for register
  Future<dynamic> postRegister(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _data = json.encode(object);

    var _header = {
      'Content-Type': 'application/json',
    };
    var response = await client.post(url, body: _data, headers: _header);
    // print(response.body);
    // var hey = jsonDecode(response.body);
    // print("helllo hiii $hey");
    // messageEmail = hey["Message"]["email"];
    // print(messageEmail);

    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   return response;
    // } else {
    //   //throw exception
    //   // Exception('cannot connect to it ');
    // }
    return response.body;
  }

  //post for login
  Future<dynamic> postLogin(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _data = json.encode(object);
    print(_data); // for checking data is present or not
    var _header = {
      'Content-Type': 'application/json',
    };
    var response = await client.post(url, body: _data, headers: _header);

    return response.body;
  }

//verify user
  Future<dynamic> postVerifyUser(String api, VerifyUser object) async {
    // print(object.userId);
    // print(object);

    var url = Uri.parse(baseUrl + api);
    var _data = json.encode(object);
    var _header = {
      'Content-Type': 'application/json',
    };
    var response = await client.post(url, body: _data, headers: _header);

    return response.body;
  }

  // resend code
  Future<dynamic> postResendCode(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _data = json.encode(object);
    var _header = {
      'Content-Type': 'application/json',
    };
    var response = await client.post(url, body: _data, headers: _header);
    return response.body;
  }

  // update password
  Future<dynamic> postUpdatePassword(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _data = json.encode(object);
    var _header = {
      'Content-Type': 'application/json',
    };
    var response = await client.post(url, body: _data, headers: _header);
    return response.body;
  }

  //serach user
  Future<dynamic> postSearchUser(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _data = json.encode(object);
    var _header = {
      'Content-Type': 'application/json',
    };
    var response = await client.post(url, body: _data, headers: _header);
    return response.body;
  }
}
