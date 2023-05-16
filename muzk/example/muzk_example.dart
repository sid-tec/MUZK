import 'package:muzk/muzk.dart';
import 'package:muzk/src/model/value_tree_classes.dart';

void main() async {
  final artist_maps = await Repo.load(what: What.artist);
  print(artist_maps);
  final artists = createArtists(artist_maps);
  print(artists);

  for (var artist in artists) {
    print(artist.name);
  }
}

List<Artist> createArtists(Iterable<dynamic> maps) {
  final r = <Artist>[];

  for (var map in maps) {
    r.add(Artist.create(id: map['id_deezer'], name: map['name']));
  }

  return r;
}
