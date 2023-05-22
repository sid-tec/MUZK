/* //import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class Label {
  final String _text;
  static const min_lenght = 1;
  static const max_lenght = 300;

  Label._(this._text);

  factory Label.create({@required String text}) {
    if (text == null || text.isEmpty) {
      throw AssertionError('Invalid Label, null or empty');
    }
    if (text.length < Label.min_lenght) {
      print(text);
      throw AssertionError('Invalid Label, is too short');
    }
    if (text.length > Label.max_lenght) {
      throw AssertionError('Invalid Label, is too long');
    }
    return Label._(text);
  }

  @override
  String toString() => _text;

  // EQUALITY
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Label && o._text == _text;
  }

  @override
  int get hashCode => _text.hashCode;
}
 */