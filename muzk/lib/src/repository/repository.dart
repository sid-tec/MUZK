import 'package:sid_d_d/sid_d_d.dart';
//
import '../model/playlist_tree.dart';
import '../model/user_tree.dart';
import '../model/what.dart';
import '../model/artist_tree.dart';
import '../model/album_tree.dart';
import '../model/track_tree.dart';
import '../model/track_file_tree.dart';

class Repo {
  static Future<List<ValueTree>> load({
    required What what,
  }) async {
    final list = await Repository.readJsonFile(what.name);
    switch (what) {
      //
      case What.artist:
        return Artist.createMany(artistList: list).toList()
          ..sort((a, b) => a.name.compareTo(b.name));
      //
      case What.album:
        return Album.createMany(albumList: list).toList()
          ..sort((a, b) => a.title.compareTo(b.title));
      //
      case What.track:
        return Track.createMany(trackList: list).toList()
          ..sort((a, b) => a.title.compareTo(b.title));
      //
      case What.trackFile:
        return TrackFile.createMany(trackFileList: list).toList()
          ..sort((a, b) => a.file.compareTo(b.file));
      //
      case What.playlist:
        return Playlist.createMany(playlistList: list).toList()
          ..sort((a, b) => a.title.compareTo(b.title));
      //
      case What.user:
        return User.createMany(userList: list).toList()
          ..sort((a, b) => a.name.compareTo(b.name));
    }
  }

/*  
  static Future<void> saveJsonFile(
          {required Iterable<Map> mapList, required What what}) async =>
      File(path(what)).writeAsStringSync(json.encode({what.name: mapList})); */
  // {"users":[{"id":1,"user":"user1","password":"p455w0rd"},{"id":2,"user":"user2","pass":"p455w0rd"}]}
}
