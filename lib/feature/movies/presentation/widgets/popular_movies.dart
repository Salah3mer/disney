import 'package:disney/core/components/components.dart';
import 'package:disney/feature/details/presentation/screens/movie_details_screen.dart';
import 'package:disney/feature/movies/presentation/cubit/popular_movie_cubit/movies_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/popular_movie_cubit/movies_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is GetPopularMoviesSuccessState) {
          return SizedBox(
            height: 240,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> MovieDetailsScreen(id :state.popularMovies[index].id)));
                        },
                        child: bulidMovieCard(movie: state.popularMovies, index: index)),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: state.popularMovies.length),
          );
        } else {
          return bulidLoading();
        }
      },
    );
  }
}
