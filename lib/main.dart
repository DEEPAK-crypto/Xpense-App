import './widgets/user_transactions.dart';
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 80, bottom: 25),
              alignment: AlignmentDirectional(-0.85, 0),
              child: Text(
                'Expense App',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
