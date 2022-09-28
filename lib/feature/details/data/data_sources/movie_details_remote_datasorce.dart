 import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:disney/core/error/expceptin.dart';
import 'package:disney/core/error/failure.dart';
import 'package:disney/core/network/api_error_model.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/data/models/movie_details_model.dart';

 abstract class BaseMovieDetailsRemoteDatasorce{
   Future<MovieDetailsModel> getMovieDetails(int movieId);
}

class MovieDetailsRemoteDatasorce implements BaseMovieDetailsRemoteDatasorce{

  @override
  Future< MovieDetailsModel> getMovieDetails(int movieId) async{
   final response =await Dio().get(ApiConstans.movieDetails(movieId));
   if (response.statusCode == 200) {
    return MovieDetailsModel.fromJson(response.data);
   } else {
    throw ServerException(
        apiErrorModel: ApiErrorModel.fromJson(response.data));
   }
  }
  }
