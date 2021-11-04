import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child: Container(
              child: Text('Chart goes here'),
              width: 100,
            ),
            color: Colors.blue,
            elevation: 5,
          ),
          Column(
              children: transactions.map((transaction) {
            return Card(
                child: Row(
              children: [
                Container(
                    child: Text(transaction.amount.toString()), width: 100),
                Column(
                  children: [
                    Text(transaction.title),
                    Text(transaction.date.toString())
                  ],
                )
              ],
            ));
          }).toList()),
        ],
      ),
    );
  }
}
