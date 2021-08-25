import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercent;

  ChartBar(this.label, this.spendingAmount, this.spendingPercent);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          // Text(
          //   '\$${spendingAmount.toStringAsFixed(0)}',
          //   style: TextStyle(color: Colors.white),
          // ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 80,
            width: 30,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.red,
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.centerRight,
                  heightFactor: spendingPercent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(104, 78, 110, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: TextStyle(color: Color.fromRGBO(133, 122, 138, 1)),
          )
        ],
      ),
    );
  }
}
