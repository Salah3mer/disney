import 'package:disney/feature/details/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieStateWidget extends StatelessWidget {
  const MovieStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
      if (state is GetMovieDetailsSuccessState) {
        return Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(width: .5,color: Colors.grey))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Icon(
                        size: 30,
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.movieDetails.voteAverage.toString(),
                            style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                height: 1.3),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            '/ 10',
                            style: TextStyle(
                                color: Colors.white.withOpacity(.7),
                                fontSize: 10,
                                height: 1.3),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Rating',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Icon(
                        size: 30,
                        Icons.money_off_csred_outlined,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        '${state.movieDetails.revenue.toString()} USD',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Revenue',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Icon(
                        size: 30,
                        Icons.local_movies_outlined,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        state.movieDetails.status.toString(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'State',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            height: 1.3),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }
}
