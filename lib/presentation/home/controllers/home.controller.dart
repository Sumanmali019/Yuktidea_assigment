import 'package:get/get.dart';

class HomeController extends GetxController {
  // final List<Map<String, String>> items = [
  //   {'text': 'Item 1', 'imageUrl': 'assets/images/country.png'},
  //   {'text': 'Item 2', 'imageUrl': 'assets/images/country.png'},
  //   {'text': 'Item 3', 'imageUrl': 'assets/images/country.png'},
  //   {'text': 'Item 4', 'imageUrl': 'assets/images/country.png'},
  //   {'text': 'Item 5', 'imageUrl': 'assets/images/country.png'},
  //   {'text': 'Item 6', 'imageUrl': 'assets/images/country.png'},
  // ].obs;

  var selectedItemId = Rxn<int>();

  // final RxList<Map<String, dynamic>> items = List.generate(
  //   6,
  //   (index) => {
  //     'id': index,
  //     'text': 'Item ${index + 1}',
  //     'imageUrl': 'assets/images/country.png',
  //     'isSelected': false,
  //   },
  // ).obs;

  final RxList<Map<String, dynamic>> contrylist = RxList([
    {
      'id': 0,
      'text': 'Australia',
      'imageUrl': 'assets/images/aus.png',
      'isSelected': false,
    },
    {
      'id': 1,
      'text': 'Canada',
      'imageUrl': 'assets/images/canada.png',
      'isSelected': false,
    },
    {
      'id': 2,
      'text': 'Ireland',
      'imageUrl': 'assets/images/ice_land.png',
      'isSelected': false,
    },
    {
      'id': 3,
      'text': 'New Zealand',
      'imageUrl': 'assets/images/new.png',
      'isSelected': false,
    },
    {
      'id': 4,
      'text': 'USA',
      'imageUrl': 'assets/images/usa.png',
      'isSelected': false,
    },
    {
      'id': 5,
      'text': 'UK',
      'imageUrl': 'assets/images/uk.png',
      'isSelected': false,
    },
  ]);

  void toggleItemSelection(int id) {
    for (var index = 0; index < contrylist.length; index++) {
      if (contrylist[index]['id'] == id) {
        contrylist[index]['isSelected'] = true; // Select the tapped item
      } else {
        contrylist[index]['isSelected'] = false; // Deselect all other contrylist
      }
    }
    contrylist.refresh(); // Notify listeners about the update
  }
}
