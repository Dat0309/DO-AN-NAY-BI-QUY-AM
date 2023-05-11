// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identification_app/constants/app_url.dart';
import 'package:http/http.dart' as http;

class AgricultureRepo extends GetxService {
  AgricultureRepo();

  Future<http.Response> agricultureRecognition(AssetImage image) async {
   final Map<String,dynamic> file = {
    'file' : image
   };
    print(file);
    // ignore: avoid_print

    http.Response res = await http.post(
      Uri.parse(AppUrl.RECOGNITION),
      body: file,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    return res;
  }
}
