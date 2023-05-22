/*
//import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class FileName {
  final String _name;
  static const min_lenght = 3;
  static const max_lenght = 300;

  FileName._(this._name);

  factory FileName.createFromFullPath({@required String path}) =>
      FileName.create(name: FileName.fileNameFromFullPath(path));

  factory FileName.create({@required String name}) {
    if (name == null || name.isEmpty) {
      throw AssertionError('Invalid FileName, null or empty');
    }
    if (name.length < FileName.min_lenght) {
      throw AssertionError('Invalid FileName, is too short');
    }
    if (name.length > FileName.max_lenght) {
      throw AssertionError('Invalid FileName, is too long');
    }
    final regexFileName = RegExp(r'^[^\\/:*?"<>|\r\n]*$');
    if (!regexFileName.hasMatch(name)) {
      throw AssertionError('Invalid FileName, does not match the REGEX');
    }
    return FileName._(name);
  }

  @override
  String toString() => _name;

  static String fileNameFromFullPath(String path) {
    if (path.contains('\\')) {
      return path.split('\\').last.toString();
    }
    return path;
  }

  String get extension => _name.split('.').last.toString().toLowerCase();

  bool get isDeezerFile =>
      _name.contains('128kbps') || _name.contains('320kbps');

  bool get isMP3 => extension == 'mp3';

  int get id => int.parse(
      _name.substring(_name.lastIndexOf(']') + 2, _name.lastIndexOf('-') - 1));

  // EQUALITY
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }
    return o is FileName && o._name == _name;
  }

  @override
  int get hashCode => _name.hashCode;
}
*/
