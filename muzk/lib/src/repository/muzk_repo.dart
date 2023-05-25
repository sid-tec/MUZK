import 'package:sid_d_d/sid_d_d.dart';

import '../../muzk.dart';
import '../model/interfaces.dart';
import '../model/what.dart';
import 'repository.dart';

class MuzkRepo implements IMuzkRepo {
  late final Iterable<IAlbum> _albums;
  late final Map<int, int> _albumsIds;
  late final Iterable<IArtist> _artists;
  late final Map<int, int> _artistsIds = {};
  late final Iterable<IPlaylist> _playlists;
  late final Map<int, int> _playlistsIds = {};
  late final Iterable<ITrackFile> _trackFiles;
  late final Map<String, int> _trackfilesIds = {};
  late final Iterable<ITrack> _tracks;
  late final Map<int, int> _tracksIds = {};
  late final Iterable<IUser> _users;
  late final Map<int, int> _usersIds = {};

  Future<void> load() async {
    _albums = await Repo.load(what: What.album) as Iterable<IAlbum>;
    _artists = await Repo.load(what: What.artist) as Iterable<IArtist>;
    _playlists = await Repo.load(what: What.playlist) as Iterable<IPlaylist>;
    _trackFiles = await Repo.load(what: What.trackFile) as Iterable<ITrackFile>;
    _tracks = await Repo.load(what: What.track) as Iterable<ITrack>;
    _users = await Repo.load(what: What.user) as Iterable<IUser>;

    var i = 0;
    for (var a in _albums) {
      _albumsIds.putIfAbsent(a.id, () => i++);
    }
    i = 0;
    for (var a in _artists) {
      _artistsIds.putIfAbsent(a.id, () => i++);
    }
    i = 0;
    for (var a in _playlists) {
      _playlistsIds.putIfAbsent(a.id, () => i++);
    }
    i = 0;
    for (var a in _trackFiles) {
      _trackfilesIds.putIfAbsent(a.uid, () => i++);
    }
    i = 0;
    for (var a in _tracks) {
      _tracksIds.putIfAbsent(a.id, () => i++);
    }
    i = 0;
    for (var a in _users) {
      _usersIds.putIfAbsent(a.id, () => i++);
    }
  }

  @override
  IArtist artist({required int id}) => _artists.elementAt(_artistsIds[id]!);

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

  @override
  Iterable<ValueTree> getValueTree({
    required What what,
    Iterable<int> ids = const <int>[],
    Iterable<String> uids = const <String>[],
    int page = 1,
    int perPage = 0,
  }) {
    switch (what) {
      case What.artist:
        return _artists.map((e) => e as ValueTree);
      case What.album:
        return _albums.map((e) => e as ValueTree);
      default:
        return <ValueTree>[];
    }
  }
}
