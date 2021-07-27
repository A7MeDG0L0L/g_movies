import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:g_movies/models/movies_model.dart';
import 'package:g_movies/modules/top_rated_screen.dart';
import 'package:g_movies/shared/cubit/cubit.dart';
import 'package:g_movies/shared/cubit/states.dart';
import 'package:g_movies/shared/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesCubit()
          ..getTopRatedData()
          ..getPopularData()
          ..getComingSoonData()
          ..getNowPlayingData();
      },
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // MoviesCubit.get(context).topRated=[];
          if (state is GetTopRatedLoadingState ||
              state is GetPopularLoadingState ||
              state is GetComingSoonLoadingState ||
              state is GetNowPlayingLoadingState) {
            return Container(child: Center(child: CircularProgressIndicator()));
          } else if (state is GetTopRatedErrorState ||
              state is GetPopularErrorState ||
              state is GetComingSoonLoadingState ||
              state is GetNowPlayingLoadingState) {
            Fluttertoast.showToast(
              msg: 'Error :(',
              backgroundColor: Colors.red,
              gravity: ToastGravity.CENTER,
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'GMovies',
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: defaultColor,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CircleAvatar(
                    radius: 20,
                    child: IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ExpandablePanel(
                          theme: ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                          ),
                          header: Row(
                            children: [
                              Text(
                                'Top Rated',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Movies',
                                style: TextStyle(
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                          collapsed: SizedBox(
                            height: 2,
                          ),
                          expanded: SizedBox(
                            width: double.infinity,
                            height: 200,
                            child: Conditional.single(
                              context: context,
                              conditionBuilder: (context) =>
                                  MoviesCubit.get(context).topRated != null,
                              widgetBuilder: (context) => ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => movieItem(
                                    MoviesCubit.get(context)
                                        .topRated!
                                        .results[index]),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                                itemCount: MoviesCubit.get(context)
                                    .topRated!
                                    .results
                                    .length,
                              ),
                              fallbackBuilder: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 220,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TopRatedScreen(),
                                  ));
                            },
                            child: Text(
                              'Show All',
                              style: GoogleFonts.aleo(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpandablePanel(
                      theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                      ),
                      header: Row(
                        children: [
                          Text(
                            'Popular',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Movies',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      collapsed: SizedBox(
                        height: 2,
                      ),
                      expanded: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => movieItem(
                              MoviesCubit.get(context).popular!.results[index]),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                          itemCount:
                              MoviesCubit.get(context).popular!.results.length,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpandablePanel(
                      theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                      ),
                      header: Row(
                        children: [
                          Text(
                            'Coming',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Soon',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      collapsed: SizedBox(
                        height: 2,
                      ),
                      expanded: SizedBox(
                        width: double.infinity,
                        height: 200,
                        child: Conditional.single(
                            context: context,
                            conditionBuilder: (context) =>
                                MoviesCubit.get(context).popular != null,
                            widgetBuilder: (context) => ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => movieItem(
                                      MoviesCubit.get(context)
                                          .comingSoon!
                                          .results[index]),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 10,
                                  ),
                                  itemCount: 20,
                                ),
                            fallbackBuilder: (context) =>
                                Center(child: CircularProgressIndicator())),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ExpandablePanel(
                      theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                      ),
                      header: Row(
                        children: [
                          Text(
                            'Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Playing',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      collapsed: SizedBox(
                        height: 2,
                      ),
                      expanded: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Conditional.single(
                            context: context,
                            conditionBuilder: (context) =>
                                MoviesCubit.get(context).nowPlaying != null,
                            widgetBuilder: (context) => ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => movieItem(
                                  MoviesCubit.get(context)
                                      .nowPlaying!
                                      .results[index]),
                              separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                              itemCount: 20,
                            ),
                            fallbackBuilder: (context) =>
                                Center(child: CircularProgressIndicator()),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget movieItem(Result model) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          fit: BoxFit.fill,
          width: 140,
          height: 210,
          image:
              NetworkImage('http://image.tmdb.org/t/p/w500${model.posterPath}'),
        ),
      ),
    );
  }
}
