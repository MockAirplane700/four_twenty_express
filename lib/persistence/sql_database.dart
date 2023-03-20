import 'package:four_twenty_express/constants/functions.dart';
import 'package:four_twenty_express/objects/history.dart';
import 'package:four_twenty_express/objects/store.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLDatabase {
  static late Database _database;

  // INIT DATABASE
  static Future openDb() async {
    _database = await openDatabase(
        join(await getDatabasesPath(), "tiffinOnDemandDB.ddb"),
        version: 1,
        onCreate: (Database db, int version) async {
          // ORDER HISTORY TABLE
          // id, uid ( product uid ) , storeUid,image, total, quantity, type,
          await db.execute(
              "CREATE TABLE history("
                  "id INTEGER PRIMARY KEY autoincrement,"
                  "uid TEXT, storeUid TEXT, image TEXT,"
                  "total TEXT, quantity TEXT, type TEXT"
                  ")"
          );
          // SAVED STORES TABLE
          // id , name, description, images, products( uid ), website, address[ list - for franchises], phone, email
          await db.execute(
              "CREATE TABLE stores("
                  "id INTEGER PRIMARY KEY autoincrement,"
                  "name TEXT, description TEXT, images TEXT,"
                  "products TEXT, website TEXT, address TEXT,"
                  "phone TEXT, email TEXT, rating TEXT"
                  ")"
          );
        }
    );
    return _database;
  }//end open db

  // INSERT HISTORY
  static Future insertHistory(History history) async {
    await openDb();
    try {
      return await _database.insert('history', history.toJson(), conflictAlgorithm: ConflictAlgorithm.ignore);
    } catch (error) {
      throw Exception('Failed to insert history ${error.toString()}');
    }//end try-catch
  }//end insert history

  // INSERT STORE
  static Future insertStore(Store store) async {
    await openDb();
    try {
      return await _database.insert('stores', store.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (error) {
      throw Exception('Failed to insert store ${error.toString()}');
    }//end try-catch
  }//end insert store

  // GET STORES
  static Future<List<Store>> getStores() async {
    await openDb();
    try {
      final List<Map<String, dynamic>> maps = await _database.query('stores');

      return List.generate(maps.length, (index) {
        return Store(
            id: maps[index]['id'].toString(), name: maps[index]['name'], description: maps[index]['description'],
            images: getImages(maps[index]['images']),
            products: getImages(maps[index]['products']),
            address: maps[index]['address'].split(','),
            website: maps[index]['website'], phone:maps[index]['phone'] ,
            email: maps[index]['email'], rating: maps[index]['rating']);
      }).toList();
    }catch (error) {
      throw Exception('An error occurred could not get stores, ${error.toString()}');
    }//end try-catch
  }//end get stores

  // GET HISTORY
  static Future<List<History>> getHistory() async {
    await openDb();
    try {
      final List<Map<String, dynamic>> maps = await _database.query('history');

      return List.generate(maps.length, (index) {
        return History(
            id: maps[index]['id'], uid: maps[index]['uid'], storeUid: maps[index]['storeUid'],
            image: maps[index]['image'], total: double.parse(maps[index]['total']),
            quantity: int.parse(maps[index]['quantity']), type: maps[index]['type']
        );
      }).toList();
    } catch (error) {
      throw Exception('Error occurred, get History failed ${error.toString()}');
    }//end try-catch
  }//get history

  // DELETE STORE
  static Future<void> deleteStore(Store store) async {
    await openDb();
    try {
      await _database.delete(
          'stores', where: 'id=?', whereArgs: [store.id]
      );
    } catch (error) {
      throw Exception('Error deleting store, ${error.toString()}');
    }//end try - catch
  }//end delete store

  // UPDATE STORE
  static Future<int> updateStore(Store store) async {
    await openDb();
    try {
      return await _database.update('stores', store.toJson(), where: 'id=?', whereArgs: [store.id]);
    }catch (error) {
      throw Exception('Could not update store ${error.toString()}');
    }//end try-catch
  }//end update store

}