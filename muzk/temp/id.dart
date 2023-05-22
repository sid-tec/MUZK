/* //import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

/*
A classe Id é um value object que identifica uma Track, um Album ou um Artist da deezer
*/
class Id {
  final int _id;

  Id._(this._id);

  factory Id.create({@required int id}) {
    if (id == null || id <= 0) {
      throw AssertionError('Invalid  Id, null or zero or negative');
    }
    return Id._(id);
  }

  int get value => _id;

  @override
  String toString() => _id.toString();

  // EQUALITY
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }
    return o is Id && o._id == _id;
  }

  @override
  int get hashCode => _id.hashCode;
}
 */