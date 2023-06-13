import 'package:rateme/model/UserLogin.dart';

import '../model/listCafe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const baseUrl = 'http://192.168.77.125:8000/api';

const showListCafe = baseUrl + '/cafe';
const searchCafe = baseUrl + '/cafe/search?cafe_name=';
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

Future<List<listCafe>> cafeSearch(String params) async {
  final res = await http.get(Uri.parse('http://172.20.10.6:8000/api/cafe/search?cafe_name=${params}'),
  );
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

Future<Map<String, dynamic>> userLogin(_email, _password) async {
  final res = await http.post(
      Uri.parse(login),
      headers: {"Accept": "application/json"},
      body: {
        'email': _email,
        'password': _password,
      }
  );
  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  } else {
    throw Exception('Failed');
  }
}

Future<Map<String, dynamic>> userRegister(_name, _email, _password, _password_confirmation) async {
  final res = await http.post(
      Uri.parse(register),
      headers: {"Accept": "application/json"},
      body: {
        'name': _name,
        'email': _email,
        'password': _password,
        'password_confirmation' : _password_confirmation,
      }
  );
  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  } else {
    throw Exception('Failed');
  }
}