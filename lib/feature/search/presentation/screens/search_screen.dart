import 'package:disney/core/services/service_locator.dart' as di;
import 'package:disney/core/utils/app_constants.dart';
import 'package:disney/feature/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:disney/feature/search/presentation/widgets/search_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstans.backgrondColor,
        appBar: AppBar(
          systemOverlayStyle:
          const  SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor:AppConstans.backgrondColor,
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
        body: BlocProvider(
            create: ((context) => di.sl<SearchCubit>()),
            child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      cursorColor: Colors.brown,

                      autofocus: true,
                      onChanged: (String value) {
                        BlocProvider.of<SearchCubit>(context).getSearch(value);
                      },
                      decoration:  InputDecoration(

                        fillColor: HexColor('#2c2c33'),
                        filled: true,
                        hintText: 'Search',

                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.brown
                          ),),



                        hintStyle:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const SearchMovieCard(),

                  ],
                ),
              );
            })));
  }
}
