import 'package:masterclass_desafio02/item.dart';

void main(List<String> arguments) {
  List<Item> items = List.from(sort(getItems()).reversed);
  items.forEach((element) => print(element.toJson()));
}

List<Item> getItems() {
  List<Item> items = [];
  items.add(Item.fromMap({"id": 8, "parentId": 9, "name": "8"}));
  items.add(Item.fromMap({"id": 7, "parentId": 8, "name": "7"}));
  items.add(Item.fromMap({"id": 9, "parentId": null, "name": "9"}));
  items.add(Item.fromMap({"id": 6, "parentId": 7, "name": "6"}));
  items.add(Item.fromMap({"id": 0, "parentId": 1, "name": "0"}));
  items.add(Item.fromMap({"id": 5, "parentId": 6, "name": "5"}));
  items.add(Item.fromMap({"id": 1, "parentId": 2, "name": "1"}));
  items.add(Item.fromMap({"id": 2, "parentId": 3, "name": "2"}));
  items.add(Item.fromMap({"id": 4, "parentId": 5, "name": "4"}));
  items.add(Item.fromMap({"id": 3, "parentId": 4, "name": "3"}));

  return items;
}

List<Item> sort(List<Item> items) {
  List<Item> sortedItems = [];
  for (int i = 0; i < items.length; i++) {
    if (items[i].parentId == null) sortedItems.add(items[i]);
  }
  for (int j = 0; j < items.length; j++) {
    for (int i = 0; i < items.length; i++) {
      if (items[i].parentId == sortedItems[j].id) {
        sortedItems.add(items[i]);
        break;
      }
    }
  }
  return sortedItems;
}
