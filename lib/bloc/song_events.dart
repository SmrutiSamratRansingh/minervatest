import 'package:minerva_songs/bloc/base_event_state.dart';

class SongEvents extends BaseEventState {}

class GetAllSongs extends SongEvents {}

class GetMoreSongs extends SongEvents {}

class SearchForSong extends SongEvents {
  final String songName;

  SearchForSong(this.songName);
}
