/*
//import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import 'package:sid_lib/src/file_name.dart';
import 'package:sid_lib/src/file_path.dart';

class TrackFile {
  final FilePath _filePath;
  final FileName _fileName;
  final bool _hifi;
  //final bool _lrc = false;

  TrackFile._(this._filePath, this._fileName, this._hifi);

  factory TrackFile.create({@required String fullPath}) {
    // 'E:\__DEEZ\128 Deemix\OK LedZ_FrankZappa - 122 de 122\Frank Zappa - Andy [One Size Fits All] 53949351 - 128kbps.mp3'
    final filePath = FilePath.create(filePath: fullPath);
    final fileName = FileName.createFromFullPath(path: fullPath);
    //final trackId = TrackId.create(id: fileName.id);
    final hifi = fullPath.contains('320');
    return TrackFile._(filePath, fileName, hifi);
  }

  static TrackFile fromMap({@required Map map}) {
    final filePath = FilePath.create(filePath: map['filePath']);
    final fileName = FileName.create(name: map['fileName']);
    return TrackFile._(filePath, fileName, map['hifi']);
  }

  String get filePath => _filePath.toString();
  String get fileName => _fileName.toString();
  bool get hifi => _hifi;
  int get id => _fileName.id;
  bool get isMP3 => _fileName.isMP3;
  String get extension => _fileName.extension;
  bool get isDeezerFile => _fileName.isDeezerFile;

  void printInfo() {
    print('toString => ${toString()}');
    print('id => ${id.toString()}');
    print('hifi => ${hifi}');
  }

  Map toMap() {
    final map = {};
    map.putIfAbsent('filePath', () => _filePath.toString());
    map.putIfAbsent('fileName', () => _fileName.toString());
    map.putIfAbsent('hifi', () => _hifi);
    return map;
  }

  @override
  String toString() {
    return '${_filePath}\\${_fileName}';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }
    return o is TrackFile &&
        o._filePath == _filePath &&
        o._fileName == _fileName &&
        o._hifi == _hifi;
  }

  @override
  int get hashCode => _filePath.hashCode ^ _fileName.hashCode ^ _hifi.hashCode;
}
*/
