import 'package:sid_d_d/sid_d_d.dart';
//
import 'interfaces.dart';
import 'id_deezer_list_tree.dart';

class Playlist extends ValueTree implements IPlaylist {
  //
  // ===========================
  Playlist._({
    required super.values,
    required super.what,
  });

  //
  // ===========================
  factory Playlist.create({
    required int id,
    required Iterable<int> tracks,
    required String title,
  }) =>
      Playlist._(
        what: 'playlist',
        values: [
          IdDeezer(
            what: 'id',
            value: id,
          ),
          IdDeezerList.create(
            what: 'tracks',
            ids: tracks,
          ),
          Title(
            what: 'title',
            value: title,
          ),
        ],
      );

  //
  // ===========================
  static Iterable<Playlist> createMany({
    required Iterable<dynamic> playlistList,
  }) {
    final r = <Playlist>[];
    //print(albumList);
    for (var map in playlistList) {
      if (map.containsKey('id') &&
          map.containsKey('tracks') &&
          map.containsKey('title')) {
        final tracks = <int>[];
        for (var i in map['tracks']) {
          tracks.add(i);
        }
        //tracks.addAll(as Iterable<int>);
        r.add(Playlist.create(
          id: map['id'],
          tracks: tracks,
          title: map['title'],
        ));
      }
    }
    return r;
  }

  @override
  int get id => value.first.value;
  @override
  Iterable<int> get tracks {
    var v = value.elementAt(1) as IdDeezerList;
    return v.ids;
  }

  @override
  String get title => value.last.value;
}
