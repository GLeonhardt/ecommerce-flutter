import 'package:ecommerce/models/address_model.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;
  AddressCard(this.addressModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Endereço",
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700),
              overflow: TextOverflow.clip,
            ),
            Divider(),
            Text(
              "${addressModel.street}, "
              "${addressModel.number}, "
              "${addressModel.complement}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              overflow: TextOverflow.clip,
            ),
            Text(
              "${addressModel.district}, "
              "${addressModel.city} - "
              "${addressModel.state}, "
              "${addressModel.zipCode}",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
