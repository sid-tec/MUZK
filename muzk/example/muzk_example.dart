import 'package:muzk/muzk.dart';

void main() async {
  //
  final muzk = MuzkRepo();
  await muzk.load();

  for (var play in muzk.allPlaylists) {
    print(play.title);
    print('---');
    for (var track in muzk.tracks(ids: play.tracks)) {
      print(track.title);
    }
    print('\n');
  }
  print('\n----------------------------------\n');
  for (var track in muzk.allTracks) {
    print(track.title);
    print('---');
    for (var art in muzk.artists(ids: track.artists)) {
      print(art.name);
    }
    print('\n');
  }

/*   print('ARTIST');
  for (var artist in muzk.artists) {
    print(artist.id);
    print(artist.name);
    print('--');
  }
  print('\n----------------------------------\n');

  print('USER');
  for (var user in muzk.users) {
    print(user.id);
    print(user.name);
    print(user.playlists);
    print('--');
  }
  print('\n----------------------------------\n');

  print('ALBUM');
  for (var album in muzk.albums) {
    print(album.id);
    print(album.title);
    print(album.year);
    print(album.artists);
    print('--');
  }
  print('\n----------------------------------\n');

  print('TRACK');
  for (var track in muzk.tracks) {
    print(track.id);
    print(track.title);
    print(track.artists);
    print('${track.duration} seconds');
    print(track.album);
    print('--');
  }
  print('\n----------------------------------\n');

  print('TRACKFILE');
  for (var trackFile in muzk.trackFiles) {
    print(trackFile.uid);
    print('${trackFile.path}\\${trackFile.file}');
    print(trackFile.track);
    print(trackFile.hifi);
    print('--');
  }
  print('\n----------------------------------\n');

  print('PLAYLIST');
  for (var playlist in muzk.playlists) {
    print(playlist.id);
    print(playlist.title);
    print(playlist.tracks);
    print('--');
  }
  print('\n----------------------------------\n'); */

/* 
  print('DEEZER');
  final beatles = await deezerAPI(what: What.artist, id: 11);
  print(beatles);
  print('\n----------------------------------\n');
  var url = 'https://api.deezer.com/artist/11/image';
  var path = 'D:\\DEVS\\muzk\\muzk\\temp\\beatles.jpg';
  print(await picture(what: What.album, id: 12047952, size: Size.medium));
 */
}
