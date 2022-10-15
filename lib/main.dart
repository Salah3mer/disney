import 'package:disney/core/bloc_observer.dart';
import 'package:disney/core/services/service_locator.dart' as di;
import 'package:disney/feature/movies/presentation/cubit/genres_cubit/genres_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/popular_movie_cubit/movies_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:disney/feature/splash/presentation/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => di.sl<TopRatedMoviesCubit>()..getTopRated()),
        BlocProvider(
            create: (context) =>
                di.sl<NowPlayingMovieCubit>()..getNowPlayingMovies()),
        BlocProvider(create: (context) => di.sl<GenresCubit>()..getGenres()),
        BlocProvider(
            create: (context) =>
                di.sl<PopularMoviesCubit>()..getPopularMovies()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Movie App',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
