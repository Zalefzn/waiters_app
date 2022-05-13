import 'package:flutter/material.dart';
import 'package:flutter_mobile/method/method%20size/method.dart';
import 'package:flutter_mobile/model/transaction_product_model.dart';
import 'package:flutter_mobile/widgets/menu%20page/product_detail.dart';

class OrderedProductCard extends StatefulWidget {
  final TransactionProductModel transactionProductModel;
  const OrderedProductCard(this.transactionProductModel, {Key? key}) : super(key: key);

  @override
  State<OrderedProductCard> createState() => _OrderedProductCard();
}

class _OrderedProductCard extends State<OrderedProductCard> {
  @override
  Widget build(BuildContext context) {
    bool _itemPressed = false;

    return GestureDetector(
      onTap: () {
        _itemPressed = !_itemPressed;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetail(widget.transactionProductModel))
        );
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
                    widget.transactionProductModel.quantity.toString() + "x " + widget.transactionProductModel.name,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: SizeConfig.blockHorizontal * 5),
                  child: Text(
                    widget.transactionProductModel.price.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
