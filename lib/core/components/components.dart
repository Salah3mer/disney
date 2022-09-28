import 'package:cached_network_image/cached_network_image.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

Widget bulidMovieCard({required List<Movie> movie, required int index}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        cachedImage(
          ApiConstans.image(movie[index].backDropPath),
          (context, imageProvider) => Image(
            width: 120,
            height: 180,
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 120),
          child: Container(
            child: Text(
              movie[index].title,
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
                rating: movie[index].voteAverage / 2,
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
                movie[index].voteAverage.toString(),
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
    );

Widget bulidLoading() => SizedBox(
      height: 240,
      width: double.infinity,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey[800]!,
                highlightColor: Colors.grey[700]!,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 180,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 120),
                      child: Container(
                        child: const Text(
                          'Where the Crawdads Sing',
                          style: TextStyle(
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
                            rating: 5 / 2,
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
                            '10',
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
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: 5),
    );

Widget cachedImage(String image, ImageWidgetBuilder widget) =>
    CachedNetworkImage(
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: 170.0,
          width: 120.0,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Image(
        width: 120,
        height: 180,
        image: imageProvider,
        fit: BoxFit.cover,
      ),
      imageUrl: image,
    );
