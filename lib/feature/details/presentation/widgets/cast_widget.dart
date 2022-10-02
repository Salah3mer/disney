import 'package:cached_network_image/cached_network_image.dart';
import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/feature/details/presentation/cubits/movie_cast_cubit/movie_cast_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MovieCastWidget extends StatelessWidget {
  const MovieCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastCubit, MovieCastState>(
      builder: (context, state) {
        if (state is GetMovieCastSuccessState) {
          return Padding(
            padding: EdgeInsets.all(15),
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
                SizedBox(height: 5,),
                SizedBox(
                  height: MediaQuery.of(context).size.height *.15,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Icon(Icons.image,size: 70,),
                                  ),
                                ),
                            imageBuilder: (context, imageProvider) =>  Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider
                                )
                              ),
                            ),
                            imageUrl:
                                ApiConstans.image(state.cast[index].image),
                          ),
                          SizedBox(height: 5,),
                          ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 80,
                              ),
                              child: Text(state.cast[index].name,style: TextStyle(
                                color: Colors.white70,
                                overflow: TextOverflow.ellipsis
                              ) ,maxLines: 2,)),
                        ],
                      ),
                      separatorBuilder: (context, index) => SizedBox(width: 10,),
                      itemCount: state.cast.length>15 ? 15:state.cast.length),
                ),
              ],
            ),
          );
        }else return SizedBox();
      },
    );
  }
}
