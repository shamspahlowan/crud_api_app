import 'package:crud_api_app/models/product_item_model.dart';
import 'package:crud_api_app/screens/add_product.dart';
import 'package:crud_api_app/widgets/product_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<ProductItemModel> model = [];
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.grey,
        title: Text(
          "Products",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: _switchBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: Icon(Icons.add, size: 30, color: Colors.deepPurple),
      ),
    );
  }

  void _addProduct() async {
    final ProductItemModel productItem = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddProduct();
        },
      ),
    );

    widget.model.add(productItem);
    setState(() {});
  }

  Widget _switchBody() {
    if (widget.model.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Tap the '+' icon to add product items to the list.",
            style: TextStyle(color: Colors.grey, fontSize: 28),
          ),
        ),
      );
    } else {
      return Center(child: ProductList(model: widget.model));
    }
  }
}
