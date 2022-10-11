import 'package:disney/core/components/components.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/presentation/screens/movie_details_screen.dart';
import 'package:disney/feature/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchMovieCard extends StatelessWidget {
  const SearchMovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is GetSearchSuccessState) {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailsScreen(id: state.movies[index].id)));
              },
              child: SizedBox(
                height: 75,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: cachedImage(
                        ApiConstans.image(state.movies[index].backDropPath),
                        (context, imageProvider) => Image(
                          image: imageProvider,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              state.movies[index].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  height: 1.3),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              RatingBarIndicator(
                                itemCount: 5,
                                rating: state.movies[index].voteAverage / 2,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                unratedColor: Colors.white38,
                                itemSize: 12,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                state.movies[index].voteAverage.toString(),
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 2,
            ),
            itemCount: state.movies.length,
          ),
        );
      } else if (state is GetSearchLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.brown,
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }
}
