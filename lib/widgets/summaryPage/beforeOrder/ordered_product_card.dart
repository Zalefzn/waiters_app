import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/transactionProduct.dart';
import 'package:flutter_mobile/providers/transaction_provider.dart';
import 'package:flutter_mobile/utilities/methodSize/method.dart';
import 'package:flutter_mobile/widgets/menuPage/productDetail/product_detail.dart';
import 'package:provider/provider.dart';

class OrderedProductCard extends StatefulWidget {
  final TransactionProduct product;
  const OrderedProductCard(this.product, {Key? key}) : super(key: key);

  @override
  State<OrderedProductCard> createState() => _OrderedProductCard();
}

class _OrderedProductCard extends State<OrderedProductCard> {
  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    bool _itemPressed = false;

    return GestureDetector(
      onTap: () {
        _itemPressed = !_itemPressed;

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(widget.product)));
      },
      child: Container(
        height: SizeConfig.blockVertical * 20,
        width: SizeConfig.blockHorizontal * 100,
        decoration: BoxDecoration(
          color: _itemPressed ? Colors.grey.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 5),
                  child: Text(
                    widget.product.quantity.toString() +
                        "x " +
                        widget.product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: SizeConfig.blockHorizontal * 5),
                  child: Text(
                    widget.product.price.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.blockVertical * 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.blockHorizontal * 5),
                  height: SizeConfig.blockVertical * 5,
                  width: SizeConfig.blockHorizontal * 35,
                  child: Text(widget.product.notes,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      )),
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 30, color: Colors.red),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
