import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/product.dart';
import 'package:flutter_mobile/model/transactionProduct.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/widgets/menuPage/productDetail/product_detail.dart';

class ProductCard extends StatefulWidget {
  DataProduct product;

  @override
  ProductCard(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var transactionProduct = TransactionProduct(
        name: widget.product.nameProduct,
        price: double.parse(widget.product.priceProduct),
        productId: widget.product.productId);
    var priceProduct = double.parse(widget.product.priceProduct).floor();

    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(transactionProduct)),
            );
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
                  priceProduct.toString(),
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
