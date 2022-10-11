import 'package:cached_network_image/cached_network_image.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/presentation/screens/movie_details_screen.dart';
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
      errorWidget: (context, url, error) => Shimmer.fromColors(
          baseColor: Colors.grey[850]!,
          highlightColor: Colors.grey[800]!,
          child: Center(child: const Icon(Icons.image,size: 50,))),
      imageBuilder: (context, imageProvider) => Image(
        width: 120,
        height: 180,
        image: imageProvider,
        fit: BoxFit.cover,
      ),
      imageUrl: image,
    );

Widget bulidGridCard(List<Movie> movies,context,) =>  GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(.5),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1)),
    itemBuilder: (context, index) => InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context,)=>MovieDetailsScreen(id: movies[index].id)));
      },
      child: Column(
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
            ApiConstans.image(movies[index].backDropPath),
          ),
          const SizedBox(height: 5,),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 120),
            child: Container(
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
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 120),
            child: Row(
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
                const  SizedBox(
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
          )
        ],
      ),
    ),
    itemCount: movies.length);
