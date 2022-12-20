import 'dart:convert';
import 'dart:io';

void run() async {
  final file = await File('lib/pubspec_masterclass.yaml').readAsString();
  var string = jsonEncode(file);

  print(string.replaceAll('\n', '{'));
}
