import 'package:sid_d_d/sid_d_d.dart';
//
import 'interfaces.dart';
import 'artists_tree.dart';

class Track extends ValueTree implements ITrack {
  //
  // ===========================
  Track._({
    required super.values,
    required super.what,
  });

  //
  // ===========================
  factory Track.create({
    required int id,
    required Iterable<int> artists,
    required int idAlbum,
    required int seconds,
    required String title,
  }) =>
      Track._(
        what: 'track',
        values: [
          IdDeezer(
            what: 'id',
            value: id,
          ),
          Artists.create(
            artists: artists,
          ),
          IdDeezer(
            what: 'id_album',
            value: idAlbum,
          ),
          Seconds(
            value: seconds,
            what: 'duration',
          ),
          Title(
            what: 'title',
            value: title,
          ),
        ],
      );

  //
  // ===========================
  static Iterable<Track> createMany({
    required Iterable<dynamic> trackList,
  }) {
    final r = <Track>[];
    //print(albumList);
    for (var map in trackList) {
      if (map.containsKey('id') &&
          map.containsKey('title') &&
          map.containsKey('artists') &&
          map.containsKey('duration') &&
          map.containsKey('id_album')) {
        final artists = <int>[];
        for (var i in map['artists']) {
          artists.add(i);
        }
        //artists.addAll(as Iterable<int>);
        r.add(Track.create(
          id: map['id'],
          artists: artists,
          idAlbum: map['id_album'],
          seconds: map['duration'],
          title: map['title'],
        ));
      }
    }
    return r;
  }

  @override
  int get id => value.first.value;
  @override
  Iterable<int> get artists {
    var v = value.elementAt(1) as Artists;
    return v.artists;
  }

  @override
  int get album => value.elementAt(2).value;
  @override
  int get duration => value.elementAt(3).value;
  @override
  String get title => value.last.value;
}
