import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileUtils{

  static Future<void> writeData(String data, String fileName) async {
    final _dirPath = await getDirPath();

    final _myFile = File('$_dirPath/$fileName');
    await _myFile.writeAsString(data);
  }

  static Future<String> readData(String fileName) async {
    final _dirPath = await getDirPath();
    final _myFile = File('$_dirPath/$fileName');
    final data = await _myFile.readAsString(encoding: utf8);
    return data;
  }

  static Future<String> getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }
}