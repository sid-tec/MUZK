/* //import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:sid_lib/src/id.dart';
import 'package:sid_lib/src/label.dart';

class Album {
  final Id _id;
  final Label _title;
  final String _releaseDate; //  DateTime.parse("1969-07-20");
  final Id _artistId;

  Album._(this._id, this._title, this._releaseDate, this._artistId);

  factory Album.create({
    @required int albumId,
    @required String title,
    @required String releaseDate,
    @required int artistId,
  }) {
    final id = Id.create(id: albumId);
    final trackTitle = Label.create(text: title);
    final date = releaseDate;
    final artist = Id.create(id: artistId);
    return Album._(
      id,
      trackTitle,
      date,
      artist,
    );
  }

  factory Album.fromDeezer({Map track}) {
    var title = track['album']['title'];
    var id = track['album']['id'];
    var artist = track['artist']['id'];
    var releaseDate = track['album']['release_date'];
    return Album.create(
        albumId: id, title: title, releaseDate: releaseDate, artistId: artist);
  }

  // GETTERS ========
  int get id => _id.value;
  String get title => _title.toString();
  String get releaseDate => _releaseDate.toString();
  int get artist => _artistId.value;
  Map get map {
    final map = {};
    map.putIfAbsent('id', () => _id.toString());
    map.putIfAbsent('title', () => _title.toString());
    map.putIfAbsent('releaseDate', () => _releaseDate.toString());
    map.putIfAbsent('artistId', () => _artistId.toString());
    return map;
  }

  static Album fromMap({@required Map map}) {
    final id = int.parse(map['id']);
    final title = map['title'];
    final releaseDate = map['releaseDate'];
    final artistId = int.parse(map['artistId']);
    return Album.create(
      albumId: id,
      title: title,
      releaseDate: releaseDate,
      artistId: artistId,
    );
  }

  static String namePic({int artist, int album}) {
    return '${artist} - ${album}.jpg';
  }

  static String urlPic({int id}) {
    return 'https://api.deezer.com/album/${id}/image?size=xl';
  }

  void printInfo() {
    print('----------------');
    print('$id - $title');
  }

  // EQUALITY
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is Album &&
        o._id == _id &&
        o._title == _title &&
        o._releaseDate == _releaseDate &&
        o._artistId == _artistId;
  }

  @override
  int get hashCode =>
      _id.hashCode ^
      _title.hashCode ^
      _releaseDate.hashCode ^
      _artistId.hashCode;
}
 */