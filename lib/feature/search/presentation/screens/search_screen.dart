import 'package:disney/core/components/components.dart';
import 'package:disney/core/services/service_locator.dart' as di;
import 'package:disney/core/utils/app_constants.dart';
import 'package:disney/feature/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:disney/feature/search/presentation/widgets/search_movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  ScrollController scroll = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstans.backgrondColor,
        appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: AppConstans.backgrondColor,
          title: const SizedBox(
            height: 50,
            child: Image(
                image: AssetImage('assets/images/logo.png'),
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
                child: SmartRefresher(
                  footer: customFooter(),
                  onRefresh: () async {
                    await Future.delayed(const Duration(milliseconds: 1000));
                    refreshController.refreshCompleted();
                  },
                  onLoading: () async {
                    await Future.delayed(const Duration(milliseconds: 1000));

                    BlocProvider.of<SearchCubit>(context).currentname =
                        searchController.text;
                    BlocProvider.of<SearchCubit>(context).getSearch(
                      name: searchController.text,
                    );
                    refreshController.loadComplete();
                  },
                  enablePullUp: true,
                  enablePullDown: true,
                  controller: refreshController,
                  child: SingleChildScrollView(
                    controller: scroll,
                    child: Column(
                      children: [
                        TextField(
                          cursorColor: Colors.brown,
                          controller: searchController,
                          autofocus: true,
                          onChanged: (String value) {
                            BlocProvider.of<SearchCubit>(context).allMovies =
                                [];
                            BlocProvider.of<SearchCubit>(context).page = 1;
                            BlocProvider.of<SearchCubit>(context).currentname =
                                value;
                            BlocProvider.of<SearchCubit>(context)
                                .getSearch(name: value);
                          },
                          decoration: InputDecoration(
                            fillColor: HexColor('#2c2c33'),
                            filled: true,
                            hintText: 'Search',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.brown),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SearchMovieCard(),
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
