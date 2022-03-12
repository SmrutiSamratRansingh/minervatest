import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minerva_songs/bloc/song_events.dart';
import 'package:minerva_songs/bloc/song_states.dart';
import 'package:minerva_songs/json_data.dart';
import 'package:minerva_songs/model/songs_model.dart';

class SongsBloc extends Bloc<SongEvents, SongsState> {
  SongsBloc() : super(OnLoading());
  var json = JsonData.songJson;
  int listLength = 10;
  late List<SingleSongData> songsList = [];
  late List songSearched = [];
  @override
  Stream<SongsState> mapEventToState(SongEvents event) async* {
    yield OnLoading();
    if (event is GetAllSongs) {
      listLength = 10;
      var result = SongsModel.fromJson(json);
      this.songsList = result.songsList;
      yield SongsInitialState();
    }
    if (event is GetMoreSongs) {
      this.listLength = this.listLength + 10;
      yield SongsInitialState();
    }

    if (event is SearchForSong) {
      for (int i = 0; i < songsList.length; i++) {
        if (event.songName.trim() == songsList[i].title.trim()) {
          print(songsList.length);
          List<SingleSongData> tempSongList = songsList;
          this.songsList = [];
          print(songsList.length);

          songsList.add(tempSongList[i]);
          print(songsList.length);
          listLength = 1;
        }
      }
      if (songsList.length == 0) {
        yield OnError('error');
      } else {
        yield SongsInitialState();
      }
    }
  }
}
