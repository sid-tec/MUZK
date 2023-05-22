import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//
import 'package:muzk/src/model/what.dart';

const imagesPath = "temp\\img";

// DEEZER
// ============================================================================
Uri uriDeezer({
  required What what,
  required int id,
  String arguments = '',
}) =>
    Uri.parse('https://api.deezer.com/${what.name}/$id$arguments');

Future<Map> deezerAPI({
  required What what,
  required int id,
  String arguments = '',
}) async {
  //
  var map = {};
  var response = await http.get(uriDeezer(what: what, id: id));
  if (response.statusCode == 200) {
    map = convert.jsonDecode(response.body);
  } else {
    map = {'failure': 'Request failed with status: ${response.statusCode}.'};
  }
  // RETURN
  return map;
}

/* The url of the album's cover. Add 'size' parameter to the url to change
   size. Can be 'small', 'medium', 'big', 'xl' */

enum Size {
  small('small'),
  medium('medium'),
  big('big'),
  xl('xl');

  final String text;
  const Size(this.text);
}

Future<bool> picture({
  required What what,
  required int id,
  Size size = Size.xl,
}) {
  var path = p.join(
      Directory.current.path, imagesPath, what.name, '$id ${size.text}.jpg');
  return download(
      uri: uriDeezer(what: what, id: id, arguments: '/image?size=${size.text}'),
      path: path);
}

// ============================================================================
Future<bool> download({required Uri uri, required String path}) async {
  //
  var dowloaded = false;
  //
  var fileSave = File(path);
  //
  if (!(fileSave.existsSync())) {
    var client = HttpClient();
    var downloadData = <int>[];
    await client.getUrl(uri).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      response.listen((d) => downloadData.addAll(d), onDone: () async {
        await fileSave.writeAsBytes(downloadData);
      });
    });
    dowloaded = true;
  }
  // RETURN
  return dowloaded;
}
