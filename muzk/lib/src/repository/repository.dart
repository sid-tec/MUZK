import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as p;
import 'package:sid_d_d/sid_d_d.dart';
//
import '../model/what.dart';
import '../model/artist_tree.dart';
import '../model/album_tree.dart';
import '../model/track_tree.dart';
import '../model/track_file_tree.dart';

class Repo {
  static String path(What what) => p.join(
      Directory.current.path, 'lib\\src\\repository', '${what.name}.json');

  static Future<Iterable<ValueTree>> load({
    required What what,
  }) async {
    final list = await readJsonFile(what);
    switch (what) {
      case What.artist:
        return Artist.createMany(artistList: list);
      case What.album:
        return Album.createMany(albumList: list);
      case What.track:
        return Track.createMany(trackList: list);
      case What.trackFile:
        return TrackFile.createMany(trackFileList: list);
      case What.playlist:
        return [];
    }
  }

  static Future<Iterable> readJsonFile(What what) async {
    var r = jsonDecode(File(path(what)).readAsStringSync());
    return r[what.name];
  }

  // {"users":[{"id":1,"user":"user1","password":"p455w0rd"},{"id":2,"user":"user2","pass":"p455w0rd"}]}
/*   static Future<void> saveJsonFile(
          {required Map map, required What what}) async =>
      File(path(what)).writeAsStringSync(json.encode(map)); */
}
