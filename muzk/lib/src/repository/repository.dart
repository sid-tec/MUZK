import 'dart:io';
import 'package:muzk/src/model/value_tree_classes.dart';
import 'package:path/path.dart' as p;
import 'package:sid_d_d/sid_d_d.dart';
import 'dart:convert';

import 'what.dart';

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
        return <ValueTree>[];
      case What.trackFile:
        return <ValueTree>[];
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
