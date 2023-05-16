import 'dart:io';
import 'package:path/path.dart' as p;
import 'dart:convert';

import 'what.dart';

class Repo {
  static String path(What what) {
    switch (what) {
      case What.artist:
        return p.join(
            Directory.current.path, 'lib\\src\\repository', 'artist.json');
      case What.album:
        return p.join(
            Directory.current.path, 'lib\\src\\repository', 'album.json');
      case What.track:
        return p.join(
            Directory.current.path, 'lib\\src\\repository', 'track.json');
      case What.trackFile:
        return p.join(
            Directory.current.path, 'lib\\src\\repository', 'trackFile.json');
    }
  }

  static Future<Map> readJsonFile(What what) async =>
      jsonDecode(File(path(what)).readAsStringSync());

  // {"users":[{"id":1,"user":"user1","password":"p455w0rd"},{"id":2,"user":"user2","pass":"p455w0rd"}]}
  static Future<void> saveJsonFile(
          {required Map map, required What what}) async =>
      File(path(what)).writeAsStringSync(json.encode(map));

  static Future<Iterable> load({required What what}) async {
    final map = await readJsonFile(what);
    for (var element in map.entries) {
      if (element.key == what.what) return element.value;
    }
    return [];
  }
}
