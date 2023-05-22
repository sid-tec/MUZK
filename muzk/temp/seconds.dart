/* //import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class Seconds {
  final int _seconds;

  Seconds._(this._seconds);

  factory Seconds.create({@required int seconds}) {
    if (seconds == null || seconds <= 0) {
      throw AssertionError('Invalid seconds, null or zero or negative');
    }
    return Seconds._(seconds);
  }

  String get minutes => Duration(seconds: _seconds).inMinutes.toString();

  @override
  String toString() => _seconds.toString();

  // EQUALITY
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }
    return o is Seconds && o._seconds == _seconds;
  }

  @override
  int get hashCode => _seconds.hashCode;
}
 */