
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/presentation/screens/movie_details_screen.dart';
import 'package:disney/feature/movies/presentation/cubit/now_playing_movie_cubit/now_playing_movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

int _current = 0;

class NowPlayingMovies extends StatefulWidget {
  const NowPlayingMovies({Key? key}) : super(key: key);

  @override
  State<NowPlayingMovies> createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
      builder: (context, state) {
        if (state is GetNowPlayingMoviesSuccessState) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.5,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: (context, index, i) => InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> MovieDetailsScreen(id :state.nowPlayingMovies[index].id)));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Stack(
                        children: [
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
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageBuilder: (context, imageProvider) => Image(
                                height: MediaQuery.of(context).size.height / 1.5,
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              imageUrl: ApiConstans.image(
                                  state.nowPlayingMovies[index].backDropPath),
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
                            bottom: 30.0,
                            left: 10.0,
                            child: Text(
                              state.nowPlayingMovies[index].title,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 10.0,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 120),
                              child: Row(
                                children: [
                                  RatingBarIndicator(
                                    itemCount: 5,
                                    rating: state
                                            .nowPlayingMovies[index].voteAverage /
                                        2,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    unratedColor: Colors.white38,
                                    itemSize: 12,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    state.nowPlayingMovies[index].voteAverage
                                        .toString(),
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
                          )
                        ],
                      ),
                    ),
                  ),
                  itemCount: state.nowPlayingMovies.length,
                ),
              ),
              _buildCarouselIndicator()
            ],
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[200]!,
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
         ),
          );
        }
      },
    );
  }

  _buildCarouselIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _current,
      count: 5,
      effect: JumpingDotEffect(
          dotHeight: 6,
          dotWidth: 6,
          jumpScale: .7,
          verticalOffset: 20,
          activeDotColor: _current > 5 ? Colors.grey : Colors.red,
          dotColor: Colors.grey),
    );
  }
}
