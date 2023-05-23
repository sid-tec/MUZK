import 'package:sid_d_d/sid_d_d.dart';
//
import 'interfaces.dart';

//
class IdDeezerList extends ValueTree implements IIdDeezerList {
  //
  // ===========================
  IdDeezerList._({
    required super.values,
    required super.what,
  });
  //
  // ===========================
  factory IdDeezerList.create({
    required Iterable<int> ids,
    required String what,
  }) {
    final r = <IdDeezer>[];
    for (var id in ids) {
      r.add(IdDeezer(
        what: 'id',
        value: id,
      ));
    }
    return IdDeezerList._(values: r, what: what);
  }

  @override
  Iterable<int> get ids {
    final r = <int>[];
    for (var art in super.value) {
      r.add(art.value);
    }
    return r;
  }
}
