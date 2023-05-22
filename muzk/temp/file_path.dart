/* //import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:sid_lib/src/muzeek_helpers.dart';

class FilePath {
  final String _filePath;
  static const min_lenght = 3;
  static const max_lenght = 600;

  FilePath._(this._filePath);

  factory FilePath.create({@required String filePath}) {
    //
    if (filePath == null || filePath.isEmpty) {
      throw AssertionError('Invalid FilePath, null or empty');
    }
    if (filePath.length < FilePath.min_lenght) {
      throw AssertionError('Invalid FilePath, is too short');
    }
    if (filePath.length > FilePath.max_lenght) {
      throw AssertionError('Invalid FilePath, is too long');
    }
    /*
    TODO: validate RegExp de filePath 
    final regexFileName = RegExp(r'^[a-z]:\\(?:[^\\/:*?"<>|\r\n]+\\)*$');
    if (!regexFileName.hasMatch(filePath)) {
      throw AssertionError('Invalid FilePath, does not match the REGEX');
    }*/
    // RETURN
    return FilePath._(filePath);
  }

  // GETTERs
  String get path => pathFromFilePath(filePath: _filePath);
  String get file => fileFromFilePath(filePath: _filePath);
  String get ext => extFromFilePath(filePath: _filePath);

  bool get hifi => kbpsFromFilePath(filePath: _filePath) == '320';
  bool get isDeezer => kbpsFromFilePath(filePath: _filePath) != '';
  bool get isMP3 => ext == 'mp3';
  bool get isLRC => ext == 'lrc';

  int get id => idFromFilePath(filePath: _filePath);

  Map get map => {'filePath': toString()};

  void get info {
    print('--------------------');
    print('toString => ${toString()}');
    print('path => ${path}');
    print('file => ${file}');
    print('ext => ${ext}');
    print('hifi => ${hifi}');
    print('isDeezer => ${isDeezer}');
    print('isMP3 => ${isMP3}');
    print('isLRC => ${isLRC}');
    print('id => ${id.toString()}');
    print('map => ${map}');
  }

  // TO STRING
  @override
  String toString() => _filePath;

  // EQUALITY
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }
    return o is FilePath && o._filePath == _filePath;
  }

  @override
  int get hashCode => _filePath.hashCode;
}
 */