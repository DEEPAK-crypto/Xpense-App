import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxHandler;

  NewTransaction(this.addTxHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
              ),
              FlatButton(
                onPressed: () {
                  addTxHandler(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text('Add Transaction'),
                textColor: Colors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
