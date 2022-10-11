import 'package:disney/core/services/service_locator.dart' as di;
import 'package:disney/core/utils/app_constants.dart';
import 'package:disney/feature/details/presentation/cubits/movie_cast_cubit/movie_cast_cubit.dart';
import 'package:disney/feature/details/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:disney/feature/details/presentation/cubits/similer_movies_cubit/similer_movies_cubit.dart';
import 'package:disney/feature/details/presentation/widgets/cast_widget.dart';
import 'package:disney/feature/details/presentation/widgets/movie%20_state_and_rate.dart';
import 'package:disney/feature/details/presentation/widgets/movie_desc_widget.dart';
import 'package:disney/feature/details/presentation/widgets/poster.dart';
import 'package:disney/feature/details/presentation/widgets/similer_movies_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  MovieDetailsScreen({required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                di.sl<MovieDetailsCubit>()..getMovieDetails(id)),
        BlocProvider(
            create: (context) => di.sl<MovieCastCubit>()..getMovieCast(id)),
        BlocProvider(
            create: (context) => di.sl<SimilerMoviesCubit>()..getSimilerMovies(id)),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstans.backgrondColor,
        appBar:  AppBar(
          backgroundColor:Colors.transparent,
          title: const SizedBox(
            height: 50,
            child:  Image(
                image: AssetImage(
                    'assets/images/logo.png'),
                fit: BoxFit.fitWidth),
          ),

          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              PosterWidget(),
              MovieDescWidget(),
              MovieStateWidget(),
              MovieCastWidget(),
              SimilerMoviesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
