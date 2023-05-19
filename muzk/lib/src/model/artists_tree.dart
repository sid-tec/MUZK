import 'package:sid_d_d/sid_d_d.dart';
//
import 'value_leaf_classes.dart';

class Artists extends ValueTree {
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

  Iterable<int> get artists {
    final r = <int>[];
    for (var art in super.value) {
      r.add(art.value);
    }
    return r;
  }
}
