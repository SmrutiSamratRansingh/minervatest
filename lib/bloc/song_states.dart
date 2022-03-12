import 'package:minerva_songs/bloc/base_event_state.dart';

class SongsState extends BaseEventState {}

class SongsInitialState extends SongsState {}

class OnLoading extends SongsState {}

class OnError extends SongsState {
  final String message;

  OnError(this.message);
}

class NavigateToSingleSong extends SongsState {}
