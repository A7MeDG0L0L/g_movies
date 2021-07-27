import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:g_movies/models/movies_model.dart';
import 'package:g_movies/shared/cubit/cubit.dart';
import 'package:g_movies/shared/cubit/states.dart';
import 'package:g_movies/shared/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit(),
      child: BlocConsumer<MoviesCubit, MoviesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Top Rated Movies',
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: defaultColor,
                ),
              ),
            ),
            body: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                20,
                (index) => Conditional.single(
                  context: context,
                  conditionBuilder: (context) =>
                      MoviesCubit.get(context).topRated != null,
                  widgetBuilder: (context) => buildGridProduct(
                      MoviesCubit.get(context).topRated!.results[index],
                      context),
                  fallbackBuilder: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridProduct(Result model, context) {
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
