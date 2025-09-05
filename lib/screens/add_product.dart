import 'dart:convert';

import 'package:crud_api_app/models/product_item_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late TextEditingController _name;
  late TextEditingController _code;
  late TextEditingController _imgLink;
  late TextEditingController _quantity;
  late TextEditingController _unitPrice;
  int totalPrice = 0;

  @override
  void initState() {
    _name = TextEditingController();
    _code = TextEditingController();
    _imgLink = TextEditingController();
    _quantity = TextEditingController();
    _unitPrice = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _code.dispose();
    _imgLink.dispose();
    _quantity.dispose();
    _unitPrice.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1EF),
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.grey,
        title: Text(
          "Add Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Form(
                key: key,
                child: Column(
                  spacing: 10,
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(hintText: "Product name"),
                    ),
                    TextFormField(
                      controller: _code,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Product code",
                        prefixText: "#",
                        prefixStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                    TextFormField(
                      controller: _imgLink,
                      decoration: InputDecoration(hintText: "Image Link"),
                    ),
                    TextFormField(
                      controller: _quantity,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Quantity"),
                    ),
                    TextFormField(
                      controller: _unitPrice,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Unit Price"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () async {
                    final product = await remoteDataFetch();
                    if (product != null) {
                      Navigator.pop(context, product);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("something wrong with the data"),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void localDataFetch() {
    if (!areFieldsEmpty()) {
      final product = saveSendModelData();
      // print(product.code);
      Navigator.pop(context, product);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill out all fields with proper values"),
        ),
      );
    }
  }

  Future<ProductItemModel?> remoteDataFetch() async {
    if (!areFieldsEmpty()) {
      Uri uri = Uri.parse("http://35.73.30.144:2008/api/v1/CreateProduct");
      final product = saveSendModelData();
      final requestBody = product.toJson();
      Response response = await post(
        uri,
        body: jsonEncode(requestBody),
        headers: {"Content-Type": "application/json"},
      );
      print(response.statusCode);
      print(response.body);
      return product;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill out all fields with proper values"),
        ),
      );
      return null;
    }
  }

  bool areFieldsEmpty() {
    return _name.text.trim().isEmpty ||
        _code.text.trim().isEmpty ||
        _imgLink.text.trim().isEmpty ||
        _quantity.text.trim().isEmpty ||
        _unitPrice.text.trim().isEmpty;
  }

  ProductItemModel saveSendModelData() {
    return ProductItemModel.fromUI(
      _name.text,
      _code.text,
      _imgLink.text,
      _quantity.text,
      _unitPrice.text,
    );
  }
}
