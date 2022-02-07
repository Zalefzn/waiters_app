import 'package:flutter/material.dart';
import 'package:flutter_mobile/model/produk.dart';
import 'package:flutter_mobile/validation/method.dart';

class ProdukCell extends StatelessWidget {
  const ProdukCell(this.produk);
  @required
  final Produk produk;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Flexible(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: FadeInImage.assetNetwork(
                            placeholder: "images/no_image.png",
                            image: produk.image_url,
                            height: SizeConfig.blockVertical * 15,
                            width: SizeConfig.blockHorizontal * 25)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    produk.product_name,
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
