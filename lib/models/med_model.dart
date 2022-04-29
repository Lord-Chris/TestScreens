class MedModel {
  final String name;
  final String tag;
  final String type;
  final String image;
  final int dosage;
  final int price;
  MedModel({
    required this.name,
    required this.tag,
    required this.type,
    required this.image,
    required this.dosage,
    required this.price,
  });

  int count = 1;
  num get totalPrice => count * price;
  bool isSelected = false;
}
