import 'package:disney/core/components/components.dart';
import 'package:disney/core/utils/app_constants.dart';
import 'package:disney/feature/movies/presentation/cubit/popular_movie_cubit/movies_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/popular_movie_cubit/movies_state.dart';
import 'package:disney/feature/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeeAllMoviesScreen extends StatelessWidget {
  ScrollController scroll = ScrollController();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final int from;

  SeeAllMoviesScreen({Key? key, required this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (from == 1) {
      return Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            backgroundColor: AppConstans.backgrondColor,
            title: const SizedBox(
              height: 50,
              child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.fitWidth),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: AppConstans.backgrondColor,
          body: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
              builder: (context, state) {
            {
              return Padding(
                padding: EdgeInsets.all(15),
                child: customFooter(),
              );
            }
          }));
    } else {
      return Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: AppConstans.backgrondColor,
          title: const SizedBox(
            height: 50,
            child: Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.fitWidth),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: AppConstans.backgrondColor,
        body: BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
            builder: (context, state) {
          return Padding(
              padding: EdgeInsets.all(15),
              child: SmartRefresher(
                footer: customFooter(),
                onRefresh: () async {
                  await Future.delayed(const Duration(milliseconds: 1000));
                  _refreshController.refreshCompleted();
                },
                onLoading: () async {
                  await Future.delayed(const Duration(milliseconds: 1000));
                  // ignore: use_build_context_synchronously
                  BlocProvider.of<TopRatedMoviesCubit>(context).getTopRated();
                  _refreshController.loadComplete();
                },
                enablePullUp: true,
                enablePullDown: true,
                controller: _refreshController,
                child: SingleChildScrollView(
                    controller: scroll,
                    child: Column(children: [
                      bulidGridCard(
                          BlocProvider.of<TopRatedMoviesCubit>(context)
                              .allMovies,
                          context),
                    ])),
              ));
        }),
      );
    }
  }
}
