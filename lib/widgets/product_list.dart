import 'package:crud_api_app/models/product_item_model.dart';
import 'package:crud_api_app/widgets/product_list_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final List<ProductItemModel> model;
  const ProductList({super.key, required this.model});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: ListView.builder(
        itemCount: widget.model.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductListCard(model: widget.model[index],);
        },
      ),
    );
  }
}
