import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieweb/models/response/movie_model.dart';
import 'package:movieweb/services/movie_services.dart';
import 'package:movieweb/utils/appConstant/app_constant.dart';

class MoviesController extends GetxController {
  final MovieServices _movieServices = MovieServices();
  final RxString _errorMsg = "".obs;

  RxString get errorMsg => _errorMsg;

 Future<List<MovieModel>?> getNowPlayingList() async {
    try {
      final response =
          await _movieServices.getRequest(AppConstant.movieNowPlayingList);
      if (response != null && response.results is List) {
        // Convert the list of results to a list of MovieModel objects
        return response.results
            .map<MovieModel>((json) => MovieModel.fromJson(json))
            .toList();
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
