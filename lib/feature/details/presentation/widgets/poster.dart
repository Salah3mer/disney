import 'package:cached_network_image/cached_network_image.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/core/utils/app_constants.dart';
import 'package:disney/feature/details/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:disney/feature/details/presentation/widgets/movie%20_state_and_rate.dart';
import 'package:disney/feature/details/presentation/widgets/movie_desc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
      if (state is GetMovieDetailsSuccessState) {
        return SizedBox(
            height: MediaQuery.of(context).size.height / 1.75,
            width: double.infinity,
            child: Stack(children: [
              ShaderMask(
                blendMode: BlendMode.dstIn,
                shaderCallback: (rect) {
                  return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ]).createShader((Rect.fromLTRB(
                    0,
                    0,
                    rect.width,
                    rect.height,
                  )));
                },
                child: CachedNetworkImage(
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Image(
                    height: MediaQuery.of(context).size.height / 1.75,
                    width: double.infinity,
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  imageUrl: ApiConstans.image(state.movieDetails.poster),
                ),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: const Color.fromRGBO(
                      0,
                      0,
                      0,
                      0.3,
                    ),
                    highlightColor: const Color.fromRGBO(
                      0,
                      0,
                      0,
                      0.1,
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Positioned(
                bottom: 50.0,
                left: 30.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.movieDetails.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    RichText(

                      text: TextSpan(
                        text: '${state.movieDetails.releaseDate.toString()} ',
                        style: TextStyle(fontSize: 12.0, color: Colors.white70),
                        children: <TextSpan>[
                          TextSpan(text: '• '),
                          TextSpan(
                            text: AppConstans.convertHoursMinutes(state.movieDetails.runtime),
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
            ]));
      } else if (state is GetMovieDetailsLoadingState) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(

            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      } else {
        return   Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Container(

            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );

      }
    });
  }
}
