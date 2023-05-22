/* //import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:sid_lib/src/id.dart';
import 'package:sid_lib/src/label.dart';
import 'package:sid_lib/src/seconds.dart';

class Track {
  final Id _id;
  final Label _title;
  final Seconds _duration;
  final Id _albumId;
  final Id _artistId;
  String _preview;

  Track._(
    this._id,
    this._title,
    this._duration,
    this._albumId,
    this._artistId,
    this._preview,
  );

  factory Track.create({
    @required int trackId,
    @required String title,
    @required int duration,
    @required int albumId,
    @required int artistId,
    @required String preview,
  }) {
    final id = Id.create(id: trackId);
    final trackTitle = Label.create(text: title);
    final tackDuration = Seconds.create(seconds: duration);
    final album = Id.create(id: albumId);
    final artist = Id.create(id: artistId);

    return Track._(
      id,
      trackTitle,
      tackDuration,
      album,
      artist,
      preview,
    );
  }

  factory Track.fromDeezer({Map track}) {
    var title = track['title'];
    var id = track['id'];
    var seconds = track['duration'];
    var album = track['album']['id'];
    var artist = track['artist']['id'];
    var preview = track['preview'];
    return Track.create(
      trackId: id,
      title: title,
      duration: seconds,
      albumId: album,
      artistId: artist,
      preview: preview,
    );
  }

  // GETTERS ========
  int get id => _id.value;
  String get title => _title.toString();
  String get duration => _duration.toString();
  String get preview => _preview;
  int get album => _albumId.value;
  int get artist => _artistId.value;
  Map get map {
    final map = {};
    map.putIfAbsent('id', () => _id.toString());
    map.putIfAbsent('title', () => _title.toString());
    map.putIfAbsent('duration', () => _duration.toString());
    map.putIfAbsent('albumId', () => _albumId.toString());
    map.putIfAbsent('artistId', () => _artistId.toString());
    map.putIfAbsent('preview', () => _preview);
    return map;
  }

  static Track fromMap({@required Map map}) {
    final id = int.parse(map['id']);
    final title = map['title'];
    final duration = int.parse(map['duration']);
    final albumId = int.parse(map['albumId']);
    final artistId = int.parse(map['artistId']);
    final preview = map['preview'];
    return Track.create(
      trackId: id,
      title: title,
      duration: duration,
      albumId: albumId,
      artistId: artistId,
      preview: preview,
    );
  }

  void setPreview(String url) {
    _preview = url;
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
    return o is Track &&
        o._id == _id &&
        o._title == _title &&
        o._duration == _duration &&
        o._albumId == _albumId &&
        o._artistId == _artistId &&
        o._preview == _preview;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
        _title.hashCode ^
        _duration.hashCode ^
        _albumId.hashCode ^
        _artistId.hashCode ^
        _preview.hashCode;
  }
}
 */