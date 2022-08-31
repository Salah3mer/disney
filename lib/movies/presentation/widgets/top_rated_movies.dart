import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/movies/presentation/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit,MoviesState>(
      builder:(context,state) {
        var c= MoviesCubit.get(context);
        if(state is GetTopRatedMoviesSuccessState) {
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
                            ApiConstans.image(c.topRated[index].backDropPath)),
                      )),
                ),
                separatorBuilder: (context, index) => const  SizedBox(
                  width: 10,
                ),
                itemCount:c.topRated.length),
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
