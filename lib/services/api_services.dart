import 'dart:convert';
import 'dart:io';
import 'package:chatgpt_course/constants/api_conts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> getModels() async {
    try {
      var response = await http.get(Uri.parse("$BASE_URL/modelass"),
          headers: {'Authorization': 'Bearer $API_KEY'});

      Map jsonResponse = jsonDecode(response.body);

      print("jsonResponse['error'] ${jsonResponse['error']["message"]}");

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }
      print("jsonResponse $jsonResponse");
    } catch (error) {
      print("error $error");
    }
  }
}
