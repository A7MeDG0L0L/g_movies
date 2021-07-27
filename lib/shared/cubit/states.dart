abstract class MoviesStates {}

class InitialState extends MoviesStates {}

class GetTopRatedLoadingState extends MoviesStates {}

class GetTopRatedSuccessState extends MoviesStates {}

class GetTopRatedErrorState extends MoviesStates {
  late String error;

  GetTopRatedErrorState(this.error);
}

class GetPopularSuccessState extends MoviesStates {}

class GetPopularLoadingState extends MoviesStates {}

class GetPopularErrorState extends MoviesStates {
  late String error;

  GetPopularErrorState(this.error);
}

class GetNowPlayingLoadingState extends MoviesStates {}

class GetNowPlayingSuccessState extends MoviesStates {}

class GetNowPlayingErrorState extends MoviesStates {
  late String error;

  GetNowPlayingErrorState(this.error);
}

class GetComingSoonLoadingState extends MoviesStates {}

class GetComingSoonSuccessState extends MoviesStates {}

class GetComingSoonErrorState extends MoviesStates {
  late String error;

  GetComingSoonErrorState(this.error);
}

class GetAllDataSuccessfully extends MoviesStates {}
