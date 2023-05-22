import 'package:sid_d_d/sid_d_d.dart';
//
import 'interfaces.dart';

class Artist extends ValueTree implements IArtist {
  //
  // ===========================
  Artist._({
    required super.values,
    required super.what,
  });

  //
  // ===========================
  factory Artist.create({
    required int id,
    required String name,
  }) =>
      Artist._(
        what: 'artist',
        values: [
          IdDeezer(
            what: 'id',
            value: id,
          ),
          ArtistName(
            what: 'name',
            value: name,
          ),
        ],
      );

  //
  // ===========================
  static Iterable<Artist> createMany({
    required Iterable<dynamic> artistList,
  }) {
    final r = <Artist>[];
    for (var map in artistList) {
      if (map.containsKey('id') && map.containsKey('name')) {
        r.add(Artist.create(
          id: map['id'],
          name: map['name'],
        ));
      }
    }
    return r;
  }

  @override
  String get id => value.first.value;

  @override
  String get name => value.last.value;
}
