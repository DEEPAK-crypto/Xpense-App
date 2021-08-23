import 'dart:ffi';

import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>>? get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double? totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date!.day == weekDay.day &&
            recentTransactions[i].date!.month == weekDay.month &&
            recentTransactions[i].date!.year == weekDay.year) {
          totalSum = totalSum! + recentTransactions[i].amount!;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum as double,
      };
    });
  }

  double get maxSpending {
    return groupedTransactionsValues!.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionsValues);
    return Card(
      color: const Color(0xff42224a),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
      child: Container(
        height: 200,
        width: double.infinity,
        child: Row(
          children: groupedTransactionsValues!.map((data) {
            return ChartBar(
              data['day'].toString(),
              data['amount'] as double,
              maxSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / maxSpending,
            );
          }).toList(),
        ),
      ),
      elevation: 6,
    );
  }
}
