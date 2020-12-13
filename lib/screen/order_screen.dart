import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/screen/home_screen.dart';
import 'package:ecommerce/widgets/order/address_card.dart';
import 'package:ecommerce/widgets/order/products_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirmação",
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey[500]),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          AddressCard(_cartProvider.addressModel),
          ProductsCard(_cartProvider.items, _cartProvider.totalPrice),
          SizedBox(height: 4.0),
          RaisedButton(
            onPressed: () {
              _cartProvider.completeOrder(
                  _cartProvider.items, _cartProvider.addressModel);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            elevation: 0,
            textColor: Colors.white,
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Text(
                "CONFIRMAR PEDIDO",
                softWrap: false,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
