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
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        children: transactions.map((tx) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 3.0,
                        spreadRadius: 0.0,
                        offset: Offset(0, 0), // shadow direction: bottom right
                      )
                    ],
                    color: const Color(0xfff7f4f7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(200),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Text(
                    '- \$${tx.amount?.toStringAsFixed(2)} ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat.yMMMd().format(tx.date as DateTime),
                        style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
