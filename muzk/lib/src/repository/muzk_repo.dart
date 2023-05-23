import '../model/interfaces.dart';
import '../model/what.dart';
import 'repository.dart';

class MuzkRepo implements IMuzkRepo {
  late final Iterable<IAlbum> _albums;
  late final Map<int, int> _albumsIds = {};
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

  @override
  Iterable<IArtist> artists({required Iterable<int> ids}) {
    final list = <IArtist>[];
    for (var id in ids) {
      list.add(_artists.elementAt(_artistsIds[id]!));
    }
    return list;
  }

  @override
  IAlbum album({required int id}) => _albums.elementAt(_albumsIds[id]!);

  @override
  IPlaylist playlist({required int id}) =>
      _playlists.elementAt(_playlistsIds[id]!);

  @override
  ITrackFile trackFile({required String uid}) =>
      _trackFiles.elementAt(_trackfilesIds[uid]!);

  @override
  ITrack track({required int id}) => _tracks.elementAt(_tracksIds[id]!);

  @override
  Iterable<ITrack> tracks({required Iterable<int> ids}) {
    final list = <ITrack>[];
    for (var id in ids) {
      list.add(_tracks.elementAt(_tracksIds[id]!));
    }
    return list;
  }

  @override
  IUser user({required int id}) => _users.elementAt(_usersIds[id]!);

  @override
  Iterable<IAlbum> get allAlbums => _albums;

  @override
  Iterable<IArtist> get allArtists => _artists;

  @override
  Iterable<IPlaylist> get allPlaylists => _playlists;

  @override
  Iterable<ITrackFile> get allTrackFiles => _trackFiles;
  @override
  Iterable<ITrack> get allTracks => _tracks;

  @override
  Iterable<IUser> get allUsers => _users;
}
