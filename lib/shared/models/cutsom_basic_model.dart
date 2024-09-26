class CustomBasicModel {
  final String nameAr;
  final String nameEn;
  final int id;

  CustomBasicModel(
      {required this.nameAr, required this.nameEn, required this.id});
  factory CustomBasicModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return CustomBasicModel(
        nameAr: jsonData['nameAr'],
        nameEn: jsonData['nameEn'],
        id: jsonData['id']);
  }
}
