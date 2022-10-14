
import 'package:disney/core/components/components.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MovieDescWidget extends StatelessWidget {
  const MovieDescWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      builder: (context, state) {
        if (state is GetMovieDetailsSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: cachedImage(
                        ApiConstans.image(state.movieDetails.backDropPath),
                        (context, imageProvider) => Image(
                              image: imageProvider,
                              height: 180,
                              width: 120,
                              fit: BoxFit.fill,
                            ))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.movieDetails.genres.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white38,
                                ),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  state.movieDetails.genres[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        state.movieDetails.overview,
                        style: const TextStyle(
                            color: Colors.white38,
                            overflow: TextOverflow.ellipsis),
                        maxLines: 8,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[800]!,
              highlightColor: Colors.grey[700]!,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 180,
                        width: 120,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white38,
                                  ),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      width: 50,
                                      color: Colors.black,
                                    )),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                         SizedBox(
                           height: 190,
                           child: ListView.separated(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Container(
                                  color: Colors.black,
                                  height: 6,
                                  width: double.infinity,
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 5,
                              ),
                            ),
                         ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
