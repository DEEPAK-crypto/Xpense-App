import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

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
                          child: Text(
                        '\$${tx.amount!.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20),
                      ))),
                ),
                title: Text(tx.title as String),
                subtitle: Text(DateFormat.yMMMd().format(tx.date!)),
                trailing: IconButton(
                  onPressed: () {
                    return deleteTransaction(tx.id);
                  },
                  icon: Icon(Icons.delete_outlined),
                  color: Colors.redAccent,
                  iconSize: 25,
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
