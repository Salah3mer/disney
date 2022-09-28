import 'package:disney/core/components/components.dart';
import 'package:disney/core/services/service_locator.dart' as di;
import 'package:disney/feature/details/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:disney/feature/movies/presentation/cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is GetTopRatedMoviesSuccessState) {
          return SizedBox(
            height: 240,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: (){
                        di.sl<MovieDetailsCubit>().getMovieDetails(state.topRatedMovies[index].id);
                      },
                        child: bulidMovieCard(movie: state.topRatedMovies, index: index)),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: state.topRatedMovies.length),
          );
        } else {
          return bulidLoading();
        }
      },
    );
  }
}
