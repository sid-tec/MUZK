abstract class IArtist {
  int get id;
  String get name;
}

abstract class IUser {
  int get id;
  Iterable<int> get playlists;
  String get name;
}

abstract class IIdDeezerList {
  Iterable<int> get ids;
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
  int get duration;
  String get title;
}

abstract class ITrackFile {
  String get uid;
  int get track;
  String get path;
  String get file;
  bool get hifi;
}

abstract class IPlaylist {
  int get id;
  Iterable<int> get tracks;
  String get title;
}

abstract class IMuzkRepo {
  Iterable<IAlbum> get allAlbums;
  Iterable<IArtist> get allArtists;
  Iterable<IPlaylist> get allPlaylists;
  Iterable<ITrackFile> get allTrackFiles;
  Iterable<ITrack> get allTracks;
  Iterable<IUser> get allUsers;
  //
  IAlbum album({required int id});
  IArtist artist({required int id});
  IPlaylist playlist({required int id});
  ITrackFile trackFile({required String uid});
  ITrack track({required int id});
  IUser user({required int id});
  //
  Iterable<IArtist> artists({required Iterable<int> ids});
  Iterable<ITrack> tracks({required Iterable<int> ids});
}
