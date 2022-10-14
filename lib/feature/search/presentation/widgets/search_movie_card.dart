import 'package:disney/core/components/components.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/presentation/screens/movie_details_screen.dart';
import 'package:disney/feature/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchMovieCard extends StatelessWidget {
   SearchMovieCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var movies =BlocProvider.of<SearchCubit>(context).allMovies;
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {

      if (movies.isNotEmpty) {
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailsScreen(id: movies[index].id)));
            },
            child: SizedBox(
              height: 75,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: cachedImage(
                      ApiConstans.image(movies[index].backDropPath),
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
                            movies[index].title,
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
                              rating: movies[index].voteAverage / 2,
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
                              movies[index].voteAverage.toString(),
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
          itemCount: movies.length,
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
