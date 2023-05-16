import 'package:muzk/muzk.dart';

void main() async {
  final artists = await Repo.load(what: What.artist);
  final albums = await Repo.load(what: What.album);
  final tracks = await Repo.load(what: What.track);
  print(artists);
  print(albums);
  print(tracks);
}
