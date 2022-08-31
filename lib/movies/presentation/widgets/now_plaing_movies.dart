import 'dart:ui';

import 'package:disney/core/utils/api_constans.dart';
import 'package:disney/movies/presentation/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit,MoviesState>(
      builder:(context,state) {
        var c= MoviesCubit.get(context);
        if(state is GetNowPlayingMoviesSuccessState) {
          return   SizedBox(
            height: 300,
            child: ScrollSnapList(
                allowAnotherDirection: true,
                initialIndex: 0,
                focusOnItemTap: true,
                dynamicItemSize: true,
                dispatchScrollNotifications: true,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                ApiConstans.image(
                                 c.nowPlaying[index].backDropPath,
                                ),
                              ))),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular((20))),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 50,
                            width: 200,
                            color: Colors.white.withOpacity(.2),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Beast',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                itemCount: 10,
                itemSize: 200,
                onItemFocus: (v) {}),
          );
        } else {
          return   Container(
              height: 230,
              child:const Center(child: CircularProgressIndicator(),));
        }
      },
    );
  }
}
