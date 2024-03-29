// ignore_for_file: avoid_print

import 'dart:io';

import 'package:http/http.dart' as http;

Future<void> main(List<String> args) async {
  final response = await http.get(
    Uri.parse(
      'https://raw.githubusercontent.com/ez-connect/flutter-ionicons/main/lib/ionicons.dart',
    ),
  );

  final body = response.body;

  final lines = body.split('\n');

  final regex = RegExp(r'const (?<icon>\S*) = IoniconsData');

  final file = File('lib/ionicons_named.dart');
  var data = '''
// AUTOGENERATED FILE; DO NOT EDIT

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

final ionicons = {
''';

  final icons = <String>[];
  for (var line in lines) {
    if (regex.hasMatch(line)) {
      final match = regex.firstMatch(line)!;

      final icon = match.namedGroup('icon')!;

      print(icon);

      icons.add(icon);
    }
  }

  icons.sort();
  for (var icon in icons) {
    data +=
        "'$icon': IconData(Ionicons.$icon.codePoint, fontFamily: 'Ionicons', fontPackage: 'ionicons',),\n";
  }

  data += '\n};';

  if (file.existsSync()) {
    file.deleteSync(recursive: true);
  }
  file.createSync(recursive: true);
  file.writeAsStringSync(data);

  print('');
  print('Generated: ${file.absolute.path}');
  print('Formatting...');
  Process.runSync('dart', ['format', 'lib']);

  print('');
  print('DONE!');
}
