import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/movies/presentation/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit,MoviesState>(
      builder:(context,state) {
        if(state is GetPopularMoviesSuccessState) {
          return  Container(
        height: 230,
        width: double.infinity,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              height: 230,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                       ApiConstans.image(state.movies[index].backDropPath)),
                  )),
            ),
            separatorBuilder: (context, index) => const  SizedBox(
              width: 10,
            ),
            itemCount: state.movies.length),
      );
        } else {
          return   Container(
            height: 230,
              child:const Center(child: CircularProgressIndicator(),));
        }
      },
    );
  }
}
