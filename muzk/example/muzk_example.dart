import 'package:muzk/muzk.dart';
import 'package:muzk/src/model/user_tree.dart';

void main() async {
  print('ARTIST');
  final artists = await Repo.load(what: What.artist) as Iterable<IArtist>;
  for (var artist in artists) {
    print(artist.id);
    print(artist.name);
    print('--');
  }
  print('\n----------------------------------\n');

  print('USER');
  final users = await Repo.load(what: What.user) as Iterable<IUser>;
  for (var user in users) {
    print(user.id);
    print(user.name);
    print(user.playlists);
    print('--');
  }
  print('\n----------------------------------\n');

  print('ALBUM');
  final albums = await Repo.load(what: What.album) as Iterable<IAlbum>;
  //print(albums);
  for (var album in albums) {
    print(album.id);
    print(album.title);
    print(album.year);
    print(album.artists);
    print('--');
  }
  print('\n----------------------------------\n');

  print('TRACK');
  final tracks = await Repo.load(what: What.track) as Iterable<ITrack>;
  //print(tracks);
  for (var track in tracks) {
    print(track.id);
    print(track.title);
    print(track.artists);
    print('${track.duration} seconds');
    print(track.album);
    print('--');
  }
  print('\n----------------------------------\n');

  print('TRACKFILE');
  final trackFiles =
      await Repo.load(what: What.trackFile) as Iterable<ITrackFile>;
  //print(trackFiles);
  for (var trackFile in trackFiles) {
    print(trackFile.uid);
    print('${trackFile.path}\\${trackFile.file}');
    print(trackFile.track);
    print(trackFile.hifi);
    print('--');
  }
  print('\n----------------------------------\n');

  print('PLAYLIST');
  final playlists = await Repo.load(what: What.playlist) as Iterable<IPlaylist>;
  //print(playlists);
  for (var playlist in playlists) {
    print(playlist.id);
    print(playlist.title);
    print(playlist.tracks);
    print('--');
  }
  print('\n----------------------------------\n');
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
