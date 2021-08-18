import 'package:expense_app/widgets/transaction_list.dart';

import './widgets/new_transaction.dart';

import './models/transaction.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Katana',
      amount: 700,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 80),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 80,
                  bottom: 25,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Expense App',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.account_circle_outlined),
                      color: Colors.grey,
                      iconSize: 34,
                    ),
                  ],
                ),
              ),
              Card(
                color: const Color(0xff42224a),
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Text(
                    'CHART!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                elevation: 6,
              ),
              TransactionList(_userTransactions)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
        backgroundColor: Color(0xffef8767),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
