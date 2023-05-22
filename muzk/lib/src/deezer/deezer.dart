import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//
import 'package:muzk/src/model/what.dart';

// DEEZER
// ============================================================================
Future<Map> deezerAPI({
  required What what,
  required int id,
  String arguments = '',
}) async {
  //
  var map = {};
  final url = Uri.parse('https://api.deezer.com/${what.name}/$id$arguments');
  // Await the http get response, then decode the json-formatted response.
  //final uri = Uri(host: url);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    map = convert.jsonDecode(response.body);
  } else {
    map = {'failure': 'Request failed with status: ${response.statusCode}.'};
  }
  // RETURN
  return map;
}

// ============================================================================
Future<bool> download({required String url, required String path}) async {
  //
  var dowloaded = false;
  //
  var fileSave = File(path);
  //
  if (!(fileSave.existsSync())) {
    var client = HttpClient();
    var downloadData = <int>[];
    await client.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
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
