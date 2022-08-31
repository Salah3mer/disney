import 'dart:ui';

import 'package:disney/core/services/service_locator.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/core/utils/app_constants.dart';
import 'package:disney/movies/presentation/cubit/movies_cubit.dart';
import 'package:disney/movies/presentation/widgets/now_plaing_movies.dart';
import 'package:disney/movies/presentation/widgets/popular_movies.dart';
import 'package:disney/movies/presentation/widgets/top_rated_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => sl<MoviesCubit>()
          ..getPopularMovies()
          ..getTopRated()..getNowPlayingMovies(),
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            backgroundColor: AppConstans.backgrondColor,
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              child: Image(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
                  fit: BoxFit.fitWidth),
            ),
            elevation: 0,
          ),
          backgroundColor: AppConstans.backgrondColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                 const NowPlayingMovies(),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          'Popular Movies',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'See More',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                  const PopularMovies(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          'TopRated Movies',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'See More',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                  const TopRatedMovies(),
                ],
              ),
            ),
          ),
        ));
  }
}
