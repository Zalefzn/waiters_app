import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/product.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/widgets/menuPage/productDetail/product_detail.dart';

class ProductCard extends StatefulWidget {
  final DataProduct product;
  ProductCard(this.product);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var hargaProduct = double.parse(widget.product.priceProduct).floor();
    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage(widget.product)));
          },
          child: Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal * 2,
                top: SizeConfig.blockVertical * 2),
            height: SizeConfig.blockVertical * 25,
            width: SizeConfig.blockHorizontal * 45,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.product.nameProduct,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'),
                ),
                Text(
                  hargaProduct.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
