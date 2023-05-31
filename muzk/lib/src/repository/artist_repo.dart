import 'package:muzk/muzk.dart';
import 'package:sid_d_d/sid_d_d.dart';
/* import 'package:repo_bookstore/db/virtual_db.dart';
import 'package:repo_bookstore/repositories/book_interface.dart';
import 'package:repo_bookstore/models/book.dart'; */

class ArtistRepo implements Repository {
  final VirtualDB _db;

  ArtistRepo(this._db);

  @override
  Future<Iterable<ValueTree>> read(Iterable<ValueLeaf> ids) async {
    var list = <Artist>[];
    var items = await _db.list();

    for (var item in items) {
      list.add(Artist.fromMap(item));
    }
    return list;
  }

  Future<void> create(ValueTree tree);
  //Future<Iterable<ValueTree>> readAll();
  Future<void> update(ValueTree tree);
  Future<void> delete(ValueLeaf id);

  @override
  Future<Book?> getOne(int id) async {
    var item = await _db.findOne(id);
    return item != null ? Book.fromMap(item) : null;
  }

  @override
  Future<void> insert(Book book) async {
    await _db.insert(book.toMap());
  }

  @override
  Future<void> update(Book book) async {
    await _db.update(book.toMap());
  }

  @override
  Future<void> delete(int id) async {
    await _db.remove(id);
  }
}
