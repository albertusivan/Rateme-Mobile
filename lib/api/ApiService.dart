import 'package:rateme/model/UserLogin.dart';

import '../model/listCafe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = 'http://30.10.10.15:8000/api';

const showListCafe = baseUrl + '/cafe';
const searchCafe = baseUrl + '/cafe';
const register = baseUrl + '/register';
const login = baseUrl + 'login';
const comment = baseUrl + '/comment';
const addComment = baseUrl + '/comment-add';
const bookmark = baseUrl + '/bookmark';
const addbookmark = baseUrl + '/bookmark-add';

Future<List<listCafe>> fetchCafe() async {
  final res = await http.get(Uri.parse(showListCafe));
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    var parsed = data['list'].cast<Map<String, dynamic>>();
    return parsed
        .map<listCafe>((json) => listCafe.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed');
  }
}

Future<List<UserLogin>> userLogin(String email, String password) async {
  final res = await http.post(
      Uri.parse(login),
      body: {
        'email': email,
        'password': password,
      }
  );
  if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    var parsed = data['user'].cast<Map<String, dynamic>>();
    return parsed
        .map<UserLogin>((json) => UserLogin.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed');
  }
}