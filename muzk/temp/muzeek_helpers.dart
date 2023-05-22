/* //import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:sid_lib/src/file_path.dart';
import 'package:sid_lib/src/id.dart';
//import 'package:sid_lib/src/repository.dart';
import 'package:sid_lib/src/track.dart';
//import 'package:sid_lib/sid_lib.dart';

// FILE
// ============================================================================
Future<List> listPathContent({String pathFrom, bool recursive = false}) async {
  //
  var dir = Directory(pathFrom);
  var content = await dir.listSync(recursive: recursive);
  var list = <String>[];
  content.forEach(
      (element) => list.add(fullPathFromFileSystemEntity(element.toString())));
  // RETURN
  return list;
}

// ============================================================================
String fullPathFromFileSystemEntity(String path) =>
    // RETURN
    path.substring(path.indexOf('\'') + 1, path.length - 1);

// ============================================================================
Future<bool> writeMap(Map map, String path) async {
  //
  var file = await File(path);
  var content = convert.jsonEncode(map);
  var shoudBeFile = await file.writeAsString(content);
  // RETURN
  return await shoudBeFile.exists() ? true : false;
}

// ============================================================================
Future<Map> readMap(String path) async {
  //
  var file = File(path);
  var map;
  if (await file.exists()) {
    var contents = await File(path).readAsString();
    map = await convert.jsonDecode(contents);
  } else {
    map = {};
  }
  // RETURN
  return map;
}

// ============================================================================
Future<List> notDeezer({List paths}) async {
  // for log
  // print('==================================');
  var erros = [];
  for (var path in paths) {
    var fileTrack = FilePath.create(filePath: path);
    //FileName.createFromFullPath(path: path.toString());
    var filename = 'E:\\__DEEZ\\notDeezer\\${fileTrack.toString()}';
    try {
      var input = File(path.toString());
      var output = File(filename);
      if (!(output.existsSync())) {
        print(input.copySync(filename));
      }
    } catch (e) {
      erros.add(path);
      continue;
    }
  }
  // RETURN
  return erros;
}

// ============================================================================
Future<List> ifExists(List paths) async {
  //
  var list = [];
  await Future.forEach(paths, (path) async {
    var file = File(path);
    if (!(await file.exists())) {
      list.add(path);
    }
  });
  // RETURN
  return list;
}

// ============================================================================
dynamic fromMap({dynamic map}) {
  return map;
}

Map treacksFromMap({Map map}) {
  final trackMap = {};
  trackMap.putIfAbsent('track', () => Track.fromMap(map: map['track']));
  var filesMap = <FilePath>{};
  for (var file in map['files']) {
    filesMap.add(FilePath.create(filePath: file.toString()));
  }
  trackMap.putIfAbsent('files', () => filesMap);
  var idsMap = <Id>{};
  for (var id in map['playlists']) {
    idsMap.add(Id.create(id: int.parse(id.toString())));
  }
  trackMap.putIfAbsent('playlists', () => idsMap);
  // RETURN
  return trackMap;
}

String pathFromFilePath({@required String filePath}) =>
    filePath.substring(0, filePath.lastIndexOf('\\'));

String fileFromFilePath({@required String filePath}) =>
    filePath.substring(filePath.lastIndexOf('\\') + 1);

String extFromFilePath({@required String filePath}) =>
    filePath.substring(filePath.lastIndexOf('.') + 1).toLowerCase();

String kbpsFromFilePath({@required String filePath}) =>
    filePath.contains('128kbps') || filePath.contains('320kbps')
        ? filePath.substring(
            filePath.lastIndexOf('kbps') - 3, filePath.lastIndexOf('kbps'))
        : '';

int idFromFilePath({@required String filePath}) => int.tryParse(filePath
    .substring(filePath.lastIndexOf(']') + 2, filePath.lastIndexOf('-') - 1));

String removeIvalidChars(String string) {
  var newString = string.length > 150 ? string.substring(0, 100) : string;
  // RETURN
  return newString.replaceAll(RegExp(r'[":?|\\<>]'), '_');
}

String folderPreview({String name}) {
  final foldersPreview = [
    '_0123456789ab',
    'cd',
    'efg',
    'hijkl',
    'mno',
    'pqr',
    'suvxywz',
    't'
  ];
  var firstChar = name.substring(0, 1).toLowerCase();
  var folder = 'special';
  foldersPreview.forEach((element) {
    if (element.contains(firstChar)) folder = element;
  });
  // RETURN;
  return folder;
}

// ============================================================================
Future<Map<dynamic, dynamic>> read(
    {String path, String what, Function fromMap, bool isList = false}) async {
  //
  var map = {};
  var nList = 0;
  var content = await readMap(path);
  content.forEach((key, value) {
    var mapItem;
    if (isList) {
      var list = [];
      value.forEach((element) {
        list.add(fromMap(map: element));
        nList++;
      });
      mapItem = list;
    } else {
      mapItem = fromMap(map: value);
    }
    map.putIfAbsent(int.parse(key), () => mapItem);
  });
  //  for log
  print('$what => ${map.length}');
  if (isList) {
    print('$what items => $nList');
  }
  // RETURN
  return map;
}
 */