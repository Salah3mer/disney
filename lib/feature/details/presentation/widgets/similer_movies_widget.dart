import 'package:cached_network_image/cached_network_image.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/presentation/cubits/similer_movies_cubit/similer_movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class SimilerMoviesWidget extends StatelessWidget {
  const SimilerMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerMoviesCubit, SimilerMoviesState>(
      builder: (context, state) {
        if (state is GetSimilerMoviesSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      const  Text(
                        'Cast',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const  Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'See More',
                            style:
                            TextStyle(color:Colors.grey.shade500, fontSize: 16),
                          ))
                    ],
                  ),
                 
                  GridView.builder(
                    padding: const EdgeInsets.all(.5),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1)),
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 180,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 180,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Icon(Icons.image,size: 70,),
                                  ),
                                ),
                            imageBuilder: (context, imageProvider) =>  Container(
                              height: 180,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: imageProvider
                                  )
                              ),
                            ),
                            imageUrl:
                            ApiConstans.image(state.similerMovies[index].backDropPath),
                          ),
                          const SizedBox(height: 5,),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 120),
                            child: Container(
                              child: Text(
                                state.similerMovies[index].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 120),
                            child: Row(
                              children: [
                                RatingBarIndicator(
                                  itemCount: 5,
                                  rating: state.similerMovies[index].voteAverage / 2,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  unratedColor: Colors.white38,
                                  itemSize: 12,
                                ),
                                const  SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  state.similerMovies[index].voteAverage.toString(),
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
                          )
                        ],
                      ),
                      itemCount: state.similerMovies.length>15 ? 15:state.similerMovies.length),
                ],
              ),
            ),
          );
        }else {
          return const SizedBox();
        }
      },
    );
  }
}
