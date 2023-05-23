import 'package:sid_d_d/sid_d_d.dart';
//
import 'interfaces.dart';
import 'id_deezer_list_tree.dart';

class User extends ValueTree implements IUser {
  //
  // ===========================
  User._({
    required super.values,
    required super.what,
  });

  //
  // ===========================
  factory User.create({
    required int id,
    required Iterable<int> playlists,
    required String name,
  }) =>
      User._(
        what: 'user',
        values: [
          IdDeezer(
            what: 'id',
            value: id,
          ),
          IdDeezerList.create(
            what: 'playlists',
            ids: playlists,
          ),
          Title(
            what: 'name',
            value: name,
          ),
        ],
      );

  //
  // ===========================
  static Iterable<User> createMany({
    required Iterable<dynamic> albumList,
  }) {
    final r = <User>[];
    //print(albumList);
    for (var map in albumList) {
      if (map.containsKey('id') &&
          map.containsKey('playlists') &&
          map.containsKey('name')) {
        final playlists = <int>[];
        for (var i in map['playlists']) {
          playlists.add(i);
        }
        //playlists.addAll(as Iterable<int>);
        r.add(User.create(
          id: map['id'],
          playlists: playlists,
          name: map['name'],
        ));
      }
    }
    return r;
  }

  @override
  int get id => value.first.value;
  @override
  Iterable<int> get playlists {
    var v = value.elementAt(1) as IdDeezerList;
    return v.ids;
  }

  @override
  String get name => value.last.value;
}
