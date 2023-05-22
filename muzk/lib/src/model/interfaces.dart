abstract class IArtist {
  String get id;
  String get name;
}

abstract class IArtists {
  Iterable<int> get artists;
}

abstract class IAlbum {
  int get id;
  Iterable<int> get artists;
  int get year;
  String get title;
}

abstract class ITrack {
  int get id;
  Iterable<int> get artists;
  int get album;
  String get title;
}

abstract class ITrackFile {
  String get id;
  int get track;
  String get path;
  String get file;
  bool get hifi;
}
