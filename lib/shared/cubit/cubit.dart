import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_movies/models/movies_model.dart';
import 'package:g_movies/shared/cubit/states.dart';
import 'package:g_movies/shared/network/end_points.dart';
import 'package:g_movies/shared/network/remote/dio_helper.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(InitialState());

  static MoviesCubit get(context) => BlocProvider.of(context);

  MoviesModel? topRated;

  void getTopRatedData() {
    emit(GetTopRatedLoadingState());
    DioHelper.getData(
      url: topRatedMovies,
    ).then((value) {
      topRated = MoviesModel.fromJson(value.data);
      //print(value.data.toString());
      print(topRated!.results);
      emit(GetTopRatedSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetTopRatedErrorState(error.toString()));
    });
  }

  MoviesModel? popular;

  void getPopularData() async {
    emit(GetPopularLoadingState());
    DioHelper.getData(
      url: popularMovies,
    ).then((value) {
      popular = MoviesModel.fromJson(value.data);
      //print(value.data.toString());
      print(popular!.results);
      emit(GetPopularSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetPopularErrorState(error.toString()));
    });
  }

  MoviesModel? nowPlaying;

  void getNowPlayingData() {
    emit(GetNowPlayingLoadingState());
    DioHelper.getData(
      url: nowPlayingMovies,
    ).then((value) {
      nowPlaying = MoviesModel.fromJson(value.data);
      //print(value.data.toString());
      print(nowPlaying!.results);
      print(nowPlaying!.results.length);
      emit(GetNowPlayingSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetNowPlayingErrorState(error.toString()));
    });
  }

  MoviesModel? comingSoon;

  void getComingSoonData() {
    emit(GetComingSoonLoadingState());
    DioHelper.getData(
      url: upComingMovies,
    ).then((value) {
      topRated = MoviesModel.fromJson(value.data);
      //print(value.data.toString());
      print(topRated!.results);
      emit(GetComingSoonSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetComingSoonErrorState(error.toString()));
    });
  }

  void printFullText(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
