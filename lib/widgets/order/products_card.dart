import 'package:ecommerce/models/cart_item_model.dart';
import 'package:ecommerce/utils/price_utils.dart';
import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final List<CartItemModel> items;
  final double totalPrice;

  ProductsCard(this.items, this.totalPrice);

  @override
  Widget build(BuildContext context) {
    Widget _listItens() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item.quantity}x ${item.product?.name}",
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "R\$${PriceUtils.convertPriceBRL(item.totalPrice)}",
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
        }).toList(),
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Produtos",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
              overflow: TextOverflow.clip,
            ),
            Divider(),
            _listItens(),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                ),
                Text(
                  "R\$${PriceUtils.convertPriceBRL(totalPrice)}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
