import 'package:sid_d_d/sid_d_d.dart';
//
import '../model/interfaces.dart';
import '../model/what.dart';
import 'repository.dart';

class MuzkRepo {
  // implements IMuzkRepo {
  late final List<IAlbum> _albums;
  late Map<int, int> _albumsIds = {};
  late final List<IArtist> _artists;
  late Map<int, int> _artistsIds = {};
  late final List<IPlaylist> _playlists;
  late Map<int, int> _playlistsIds = {};
  late final List<ITrackFile> _trackFiles;
  late Map<String, int> _trackFilesIds = {};
  late final List<ITrack> _tracks;
  late Map<int, int> _tracksIds = {};
  late final List<IUser> _users;
  late Map<int, int> _usersIds = {};

  Future<void> save() async {
    /* var albumList = [
      {
        "id": 21,
        "artists": [1],
        "year": 1968,
        "title": "The White Album"
      },
      {
        "id": 211,
        "artists": [11],
        "year": 1979,
        "title": "Sandina"
      },
      {
        "id": 2111,
        "artists": [111],
        "year": 1969,
        "title": "Let It Bleed"
      },
      {
        "id": 3111,
        "artists": [111],
        "year": 1974,
        "title": "Satisfaction"
      },
      {
        "id": 13111,
        "artists": [111, 1],
        "year": 1977,
        "title": "Circus"
      },
      {
        "id": 12047952,
        "artists": [1],
        "year": 1970,
        "title": "Abbey Road (Remastered)"
      }
    ]; */

    //await Repo.saveJsonFile(mapList: List, what: what);
  }

  Future<void> load() async {
    //
    _artists = await Repo.load(what: What.artist) as List<IArtist>;
    var i = 0;
    _artistsIds = {for (var e in _artists) e.id: i++};
    //
    _albums = await Repo.load(what: What.album) as List<IAlbum>;
    i = 0;
    _albumsIds = {for (var e in _albums) e.id: i++};
    //
    _playlists = await Repo.load(what: What.playlist) as List<IPlaylist>;
    i = 0;
    _playlistsIds = {for (var e in _playlists) e.id: i++};
    //
    _trackFiles = await Repo.load(what: What.trackFile) as List<ITrackFile>;
    i = 0;
    _trackFilesIds = {for (var e in _trackFiles) e.uid: i++};
    //
    _tracks = await Repo.load(what: What.track) as List<ITrack>;
    i = 0;
    _tracksIds = {for (var e in _tracks) e.id: i++};
    //
    _users = await Repo.load(what: What.user) as List<IUser>;
    i = 0;
    _usersIds = {for (var e in _users) e.id: i++};
  }

  Iterable<IArtist> artists({
    Iterable<int> ids = const <int>[],
    int page = 1,
    int perPage = 0,
  }) =>
      getValueTree(
        what: What.artist,
        ids: ids,
        page: page,
        perPage: perPage,
      ).map((e) => e as IArtist);

  Iterable<IAlbum> albums({
    Iterable<int> ids = const <int>[],
    int page = 1,
    int perPage = 0,
  }) =>
      getValueTree(
        what: What.album,
        ids: ids,
        page: page,
        perPage: perPage,
      ).map((e) => e as IAlbum);

  Iterable<ValueTree> getValueTree({
    required What what,
    Iterable<int> ids = const <int>[],
    Iterable<String> uids = const <String>[],
    int page = 1,
    int perPage = 0,
  }) {
    var list = [];
    var map = {};
    var returnList = <ValueTree>[];
    switch (what) {
      case What.artist:
        list.addAll(_artists);
        map = _artistsIds;
        break;
      case What.album:
        list.addAll(_albums);
        map = _albumsIds;
        break;
      default:
        return <ValueTree>[];
    }
    if (ids.isEmpty) return list.map((e) => e as ValueTree);
    for (var id in ids) {
      if (map.containsKey(id)) {
        returnList.add(list[map[id]] as ValueTree);
      }
    }
    return returnList;
  }
}
