import 'package:muzk/muzk.dart';
import 'package:muzk/src/deezer/deezer.dart';

void main() async {
  final artists = await Repo.load(what: What.artist) as Iterable<Artist>;

  for (var artist in artists) {
    print(artist.name);
  }

  print('\n----------------------------------\n');

  final albums = await Repo.load(what: What.album) as Iterable<Album>;
  //print(albums);
  for (var album in albums) {
    print(album.title);
    print(album.artists);
  }
  print('\n----------------------------------\n');

  final tracks = await Repo.load(what: What.track) as Iterable<Track>;
  //print(tracks);
  for (var track in tracks) {
    print(track.title);
    print(track.artists);
    print('${track.duration} seconds');
  }
  print('\n----------------------------------\n');
  final tFiles = await Repo.load(what: What.trackFile) as Iterable<TrackFile>;
  //print(tracks);
  for (var track in tFiles) {
    print('${track.path}\\${track.file}');
  }
  print('\n----------------------------------\n');

  final beatles = await deezerAPI(what: What.artist, id: 11);
  print(beatles);

  print('\n----------------------------------\n');

  var url = 'https://api.deezer.com/artist/11/image';
  var path = 'D:\\DEVS\\muzk\\muzk\\temp\\beatles.jpg';

  print(await picture(what: What.album, id: 12047952, size: Size.big));

/*   final albumList = await Repo.load(what: What.album);
  //print(albumMap);
  final albums = Album.createMany(albumList: albumList);
  print(albums); */
}

/* List<Artist> createArtist(Iterable<dynamic> maps) {
  final r = <Artist>[];

  for (var map in maps) {
    r.add(Artist.create(id: map['id_deezer'], name: map['name']));
  }

  return r;
} */
