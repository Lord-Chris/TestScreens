import 'package:get/get.dart';
import 'package:test_screens/models/med_model.dart';
import 'package:test_screens/ui/constants/_constants.dart';

class FirstPageController extends GetxController {
  final mainList = kListOfMeds;
  final filteredList = [];
  bool showTextField = false;
  List<MedModel> cart = [];

  @override
  void onInit() {
    super.onInit();
    filteredList.addAll(mainList);
  }

  void toggleTextField() {
    showTextField = !showTextField;
    update();
  }

  void filterList(String text) {
    filteredList.clear();
    if (text.isEmpty) {
      filteredList.addAll(mainList);
    } else {
      for (var med in mainList) {
        if (med.name.toLowerCase().contains(text.toLowerCase())) {
          filteredList.add(med);
        }
      }
    }
    update();
  }

  void addToBag(MedModel medsModel) {
    if (cart.contains(medsModel)) {
      return update();
    }
    cart.add(medsModel);
    update();
  }

  void decrementCount(MedModel medsModel) {
    if (medsModel.count > 1) {
      medsModel.count--;
      update();
    }
  }

  void incrementCount(MedModel medsModel) {
    medsModel.count++;
    update();
  }

  void removeFromBag(MedModel medsModel) {
    cart.remove(medsModel);
    update();
  }

  void toggleSelected(MedModel data) {
    data.isSelected = !data.isSelected;
    update();
  }

  void closeCheckout() {
    for (var element in cart) {
      element.isSelected = false;
    }
  }

  num get bagTotal => cart.fold(0, (sum, element) => sum + element.totalPrice);
}
