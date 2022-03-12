import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minerva_songs/bloc/song_bloc.dart';
import 'package:minerva_songs/bloc/song_events.dart';
import 'package:minerva_songs/bloc/song_states.dart';
import 'package:minerva_songs/model/single_song.dart';
import 'package:minerva_songs/model/songs_model.dart';

class SongsList extends StatelessWidget {
  const SongsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongsBloc(),
      child: SongsListScreen(),
    );
  }
}

class SongsListScreen extends StatefulWidget {
  const SongsListScreen({Key? key}) : super(key: key);

  @override
  State<SongsListScreen> createState() => _SongsListScreenState();
}

class _SongsListScreenState extends State<SongsListScreen> {
  late ScrollController controller;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    textController = TextEditingController();
    BlocProvider.of<SongsBloc>(context).add(GetAllSongs());
    controller.addListener(() {
      print('here');
      if (controller.position.pixels == controller.position.maxScrollExtent &&
          listLenght != 100) {
        BlocProvider.of<SongsBloc>(context).add(GetMoreSongs());
      }
    });
  }

  late int listLenght;
  late List<SingleSongData> songsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: BlocConsumer<SongsBloc, SongsState>(
        builder: (context, state) {
          intiData();
          if (state is OnLoading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  controller: controller,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(songsList[index].title),
                      subtitle: Column(
                        children: [
                          Text('index:' + '$index'),
                          Text('id:' + songsList[index].id),
                          Text('acousticness:' +
                              '${songsList[index].acousticness}'),
                          Text('danceability:' +
                              '${songsList[index].danceability}'),
                          Text('energy:' + '${songsList[index].energy}'),
                          Text('mode:' + '${songsList[index].mode}'),
                          Text('tempo:' + '${songsList[index].tempo}'),
                          Text(
                              'durationMs:' + '${songsList[index].durationMs}'),
                          Text('numSections:' +
                              '${songsList[index].numSections}'),
                          Text('numSegments:' +
                              '${songsList[index].numSegments}'),
                        ],
                      ),
                      onTap: () {},
                    );
                  },
                  itemCount: listLenght,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Colors.orange,
                    );
                  },
                ),
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is OnError) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }
        },
      ),
    );
  }

  void intiData() {
    this.listLenght = BlocProvider.of<SongsBloc>(context).listLength;
    this.songsList = BlocProvider.of<SongsBloc>(context).songsList;
  }
}
