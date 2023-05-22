/* //import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:sid_lib/src/id.dart';
import 'package:sid_lib/src/label.dart';

class Artist {
  final Id _id;
  final Label _name;

  Artist._(this._id, this._name);

  factory Artist.create({
    @required int artistId,
    @required String name,
  }) {
    final id = Id.create(id: artistId);
    final artist = Label.create(text: name);
    return Artist._(
      id,
      artist,
    );
  }

  factory Artist.fromDeezer({Map track}) {
    var name = track['artist']['name'];
    var id = track['artist']['id'];
    return Artist.create(artistId: id, name: name);
  }

  // GETTERS ========
  int get id => _id.value;
  String get name => _name.toString();
  Map get map {
    final map = {};
    map.putIfAbsent('id', () => _id.toString());
    map.putIfAbsent('name', () => _name.toString());
    return map;
  }

  static Artist fromMap({@required Map map}) {
    final id = int.parse(map['id']);
    final name = map['name'];
    return Artist.create(
      artistId: id,
      name: name,
    );
  }

  static String namePic({int artist, int album}) {
    return '${artist}.jpg';
  }

  static String urlPic({int id}) {
    return 'https://api.deezer.com/artist/${id}/image?size=xl';
  }

  void printInfo() {
    print('----------------');
    print('$id - $name');
  }

  // EQUALITY
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is Artist && o._id == _id && o._name == _name;
  }

  @override
  int get hashCode => _id.hashCode ^ _name.hashCode;
}
 */