import 'package:bmi_calculator/common/configuration.dart';
import 'package:bmi_calculator/model/user_entry.dart';
import 'package:bmi_calculator/service/logging/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class IDatabaseService {
  Future<void> insertUserEntry(UserEntry userEntry);

  Future<List<UserEntry>> getAllUserEntries([int? limit]);
}

@Injectable(as: IDatabaseService)
class DatabaseService implements IDatabaseService {
  final Configuration _configuration;
  final ILogger _logger;

  DatabaseService(this._configuration, this._logger);

  final String _tableBmi = 'bmi';

  Database? _database;

  Future<void> _initialize() async {
    if (_database != null) return;
    _database = await openDatabase(
      join(await getDatabasesPath(), _configuration.databaseFile),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $_tableBmi(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT NOT NULL, 
          height INTEGER NOT NULL, 
          weight INTEGER NOT NULL,
          age INTEGER NOT NULL, 
          gender STRING NOT NULL,
          bmi DOUBLE NOT NULL)
          ''');
      },
      version: _configuration.databaseVersion,
    );
  }

  @override
  Future<void> insertUserEntry(UserEntry userEntry) async {
    await _initialize();
    var _id = await _database!.insert(_tableBmi, userEntry.toMap());
    if (_id <= 0) {
      _logger.e('DatabaseService', 'Could not insert UserEntry: $userEntry');
    }
  }

  @override
  Future<List<UserEntry>> getAllUserEntries([int? limit]) async {
    await _initialize();
    var _usersList = await _database!.query(_tableBmi, limit: limit);
    var _users = <UserEntry>[];
    _usersList.forEach((map) {
      _users.add(UserEntry.fromMap(map));
    });
    return _users;
  }
}
