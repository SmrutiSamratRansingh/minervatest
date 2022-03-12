class SongsModel {
  late List<SingleSongData> songsList;
  SongsModel.fromJson(json) {
    this.songsList = [];
    for (int i = 0; i < 100; i++) {
      songsList.add(SingleSongData.fromJson(json, i));
    }
  }
}

class SingleSongData {
  late String id, title;
  late double danceability, energy, acousticness, tempo;
  late int durationMs, numSections, numSegments, mode;
  SingleSongData.fromJson(json, int i) {
    this.id = json["id"]["$i"];
    this.title = json["title"]["$i"];
    this.danceability = json["danceability"]["$i"];
    this.energy = json["energy"]["$i"];
    this.acousticness = json["acousticness"]["$i"];
    this.mode = json["mode"]["$i"];
    this.durationMs = json["duration_ms"]["$i"];
    this.numSections = json["num_sections"]["$i"];
    this.numSegments = json["num_segments"]["$i"];
    this.tempo = json["tempo"]["$i"];
  }
}
