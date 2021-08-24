import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((tx) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  radius: 30,
                  child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Color.fromRGBO(142, 142, 142, 1),
                        size: 40,
                      ))),
                ),
                title: Text(tx.title as String),
                subtitle: Text(DateFormat.yMMMd().format(tx.date!)),
                trailing: Text(
                  '\$${tx.amount!.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              elevation: 0.5,
            );
          }).toList(),
        ),
      ),
    );
  }
}
