import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTxHandler;

  NewTransaction(this.addTxHandler);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitHandler() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    addTxHandler(enteredTitle, enteredAmount);
  }

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
                onSubmitted: (_) => submitHandler,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitHandler,
              ),
              FlatButton(
                onPressed: submitHandler,
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
