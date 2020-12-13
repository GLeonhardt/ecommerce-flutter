import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pedidos",
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
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection("users")
            .doc(_userProvider.user.id)
            .collection("orders")
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data.docs
                  .map((doc) {
                    return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("orders")
                              .doc(doc.id)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Pedido: ${snapshot.data.id}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  Text(_buildOrderDetails(snapshot.data))
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    );
                  })
                  .toList()
                  .reversed
                  .toList(),
            );
          }
        },
      ),
    );
  }

  String _buildOrderDetails(DocumentSnapshot snapshot) {
    String text =
        "Detalhes: \nData:${new DateFormat('d/M/y H:M').format(snapshot["orderDate"].toDate())}\n";
    for (LinkedHashMap item in snapshot["products"]) {
      text +=
          "${item["quantity"]}x ${item["product"]["name"]} R\$ ${(item["product"]["price"])}\n";
    }
    text += "Valor do Pedido: R\$ ${snapshot["totalCost"]}";
    return text;
  }
}
