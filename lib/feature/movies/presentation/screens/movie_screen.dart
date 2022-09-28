
import 'package:disney/core/utils/app_constants.dart';
import 'package:disney/feature/movies/presentation/widgets/now_plaing_movies.dart';
import 'package:disney/feature/movies/presentation/widgets/popular_movies.dart';
import 'package:disney/feature/movies/presentation/widgets/top_rated_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: AppConstans.backgrondColor,
        title: const SizedBox(
          height: 50,
          child:  Image(
              image: AssetImage(
                  'assets/images/logo.png'),
              fit: BoxFit.fitWidth),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      backgroundColor: AppConstans.backgrondColor,
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15,right: 15,left: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const NowPlayingMovies(),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                  const  Text(
                      'Popular Movies',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const  Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See More',
                          style:
                              TextStyle(color:Colors.grey.shade400, fontSize: 16),
                        ))
                  ],
                ),
              ),
              const PopularMovies(),
              const  SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    const Text(
                      'TopRated Movies',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const  Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See More',
                          style:
                              TextStyle(color: Colors.grey.shade400, fontSize: 16),
                        ))
                  ],
                ),
              ),
              const TopRatedMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
