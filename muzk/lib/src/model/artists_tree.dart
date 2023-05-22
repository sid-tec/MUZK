import 'package:muzk/src/model/interfaces.dart';
import 'package:sid_d_d/sid_d_d.dart';

//
class Artists extends ValueTree implements IArtists {
  //
  // ===========================
  Artists._({
    required super.values,
    required super.what,
  });
  //
  // ===========================
  factory Artists.create({
    required Iterable<int> artists,
  }) {
    final r = <IdDeezer>[];
    for (var id in artists) {
      r.add(IdDeezer(
        what: 'id_artist',
        value: id,
      ));
    }
    return Artists._(values: r, what: 'artists');
  }

  @override
  Iterable<int> get artists {
    final r = <int>[];
    for (var art in super.value) {
      r.add(art.value);
    }
    return r;
  }
}
