import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  run();
}

void run() async {
  final file = await File('lib/pubspec_masterclass.yaml').readAsLines();
  String mapString = '{${rec(file, 0, '', 0)}}';
  print(jsonDecode(mapString.replaceAll(',}', '}')));
}

String rec(List<String> list, int index, String stringFinal, int count) {
  for (int i = index; i < list.length; i++) {
    if (list[i].contains(':')) {
      var ident = ' '
          .allMatches(jsonEncode(list[i].substring(0, list[i].indexOf(':'))))
          .length;
      if (count > ident) {
        for (int i = count; i > 0; i -= 2) {
          stringFinal += '},';
        }
      }
      count = ident;
      if (list[i].substring(list[i].indexOf(':') + 1).trim().isEmpty) {
        stringFinal +=
            '${jsonEncode(list[i].substring(0, list[i].indexOf(':')).trim())}:{';
        // return rec(list, i, stringFinal);
      } else {
        stringFinal +=
            '${jsonEncode(list[i].substring(0, list[i].indexOf(':')).trim())}: ${jsonEncode(list[i].substring(list[i].indexOf(':') + 1).trim()).replaceAll('\\"', '')},';
      }
    }
  }
  return '$stringFinal},';
}
