class ProductItemModel {
  final String name;
  final int code;
  final String imgLink;
  final int quantity;
  final int unitPrice;
  final int totalPrice;

  ProductItemModel({
    required this.name,
    required this.code,
    required this.imgLink,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      name: json["ProductName"],
      code: int.tryParse(json["ProductCode"].toString()) ?? 0,
      imgLink: json["Img"].toString(),
      quantity: int.tryParse(json["Qty"].toString()) ?? 0,
      unitPrice: int.tryParse(json["UnitPrice"].toString()) ?? 0,
      totalPrice: int.tryParse(json["TotalPrice"].toString()) ?? 0,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ProductItemModel && other.code == code;

  @override
  int get hashCode => code.hashCode;

  factory ProductItemModel.fromUI(
    String teName,
    String teCode,
    String teImgLink,
    String teQuantity,
    String teUnitPrice,
  ) {
    late final String name;
    late final String imgLink;
    late final int code;
    late final int quantity;
    late final int unitPrice;
    late final int totalPrice;
    try {
      name = teName.toString().trim();
      imgLink = teImgLink.toString().trim();
      code = int.parse(teCode.toString());
      quantity = int.parse(teQuantity.toString());
      unitPrice = int.parse(teUnitPrice.toString());
      totalPrice = quantity * unitPrice;
    } catch (e) {
      print(e.toString());
    }

    return ProductItemModel(
      name: name,
      code: code,
      imgLink: imgLink,
      quantity: quantity,
      unitPrice: unitPrice,
      totalPrice: totalPrice,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "ProductName": name,
      "ProductCode": code,
      "Img": imgLink,
      "Qty": quantity,
      "UnitPrice": unitPrice,
      "TotalPrice": totalPrice,
    };
  }
}
