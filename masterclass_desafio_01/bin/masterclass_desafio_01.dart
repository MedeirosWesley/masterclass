import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  run();
}

int index = 0;
String stringFinal = '';

void run() async {
  final file = await File('lib/pubspec_masterclass.yaml').readAsLines();
  rec(file, 0);
  print(stringFinal);
  // print(mapString.replaceAll(',}', '}'));
}

rec(List<String> list, int count) {
  while (list.length > index) {
    if (list[index].contains(':')) {
      var ident = '  '
          .allMatches(
              jsonEncode(list[index].substring(0, list[index].indexOf(':'))))
          .length;

      if (list[index].substring(list[index].indexOf(':') + 1).trim().isEmpty) {
        stringFinal +=
            '${jsonEncode(list[index].substring(0, list[index].indexOf(':')).trim())}:{';
        index++;
        rec(list, ident);
      } else {
        stringFinal +=
            '${jsonEncode(list[index].substring(0, list[index].indexOf(':')).trim())}: ${jsonEncode(list[index].substring(list[index].indexOf(':') + 1).trim()).replaceAll('\\"', '')},';
      }
      if (ident < count) {
        stringFinal += '}';
      }
      count = ident;
    } else {
      while (count > 0) {
        stringFinal += '}';
        count--;
      }
    }
    index++;
  }
}
