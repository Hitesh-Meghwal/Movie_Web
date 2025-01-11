import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieweb/models/api_reponse.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  Future<ApiReponse?> getRequest(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return ApiReponse.fromJson(jsonData);
      } else {
        debugPrint('Error: Status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}
