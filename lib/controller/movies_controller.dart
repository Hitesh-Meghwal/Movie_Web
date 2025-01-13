import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieweb/models/response/movie_model.dart';
import 'package:movieweb/services/movie_services.dart';
import 'package:movieweb/utils/appConstant/app_constant.dart';

class MoviesController extends GetxController {
  final MovieServices _movieServices = MovieServices();
  final RxString _errorMsg = "".obs;
  final RxBool _isLoading = false.obs;
  final RxList<MovieModel> _nowPlayingMovieList = <MovieModel>[].obs;
  final RxList<MovieModel> _topRatedMovieList = <MovieModel>[].obs;

  RxString get errorMsg => _errorMsg;
  RxBool get isLoading => _isLoading;
  RxList<MovieModel> get nowPlayingMovieList => _nowPlayingMovieList;
  RxList<MovieModel> get topRatedMovieList => _topRatedMovieList;

  Future<void> getNowPlayingMovies() async {
    _isLoading.value = true;
    try {
      final response =
          await _movieServices.getRequest(AppConstant.movieNowPlayingList);
      if (response != null && response.results is List) {
        // Convert the list of results to a list of MovieModel objects
        _nowPlayingMovieList.value = response.results
            .map<MovieModel>((json) => MovieModel.fromJson(json))
            .toList();
      } else {
        _errorMsg.value = "Failed to fetch movies.";
      }
    } catch (e) {
      _errorMsg.value = "Failed to fetch movies.";
      debugPrint('Error: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> getTopRatedMovies() async {
    _isLoading.value = true;
    try {
      final response =
          await _movieServices.getRequest(AppConstant.topRatedPlayingList);
      if (response != null && response.results is List) {
        _topRatedMovieList.value = response.results
            .map<MovieModel>((json) => MovieModel.fromJson(json))
            .toList();
      } else {
        _errorMsg.value = "Failed to fetch top rated movies.";
      }
    } catch (e) {
      _errorMsg.value = "Failed to fetch top rated movies.";
      debugPrint('Error: $e');
    } finally {
      _isLoading.value = false;
    }
  }
}
