import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieweb/models/response/movie_model.dart';
import 'package:movieweb/services/movie_services.dart';
import 'package:movieweb/utils/appConstant/app_constant.dart';

class MoviesController extends GetxController {
  final MovieServices _movieServices = MovieServices();
  final RxString _errorMsg = "".obs;

  RxString get errorMsg => _errorMsg;

  Future<MovieModel?> getNowPlayingList() async {
    try {
      final response =
          await _movieServices.getRequest(AppConstant.movieNowPlayingList);
      if (response != null) {
        return MovieModel.fromJson(response.results);
      } else {
        _errorMsg.value = "Failed to fetch movies.";
        return null;
      }
    } catch (e) {
      _errorMsg.value = "Failed to fetch movies.";
      debugPrint('Error: $e');
      return null;
    }
  }
}
