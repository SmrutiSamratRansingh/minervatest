import 'package:flutter/material.dart';
import 'package:minerva_songs/model/songs_model.dart';

class SingleSongScreen extends StatelessWidget {
  final SingleSongData song;
  SingleSongScreen({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text('id:' + song.id),
              Text('acousticness:' + '${song.acousticness}'),
              Text('danceability:' + '${song.danceability}'),
              Text('energy:' + '${song.energy}'),
              Text('mode:' + '${song.mode}'),
              Text('tempo:' + '${song.tempo}'),
              Text('durationMs:' + '${song.durationMs}'),
              Text('numSections:' + '${song.numSections}'),
              Text('numSegments:' + '${song.numSegments}'),
            ],
          ),
        ),
      ),
    );
  }
}
