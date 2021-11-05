import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Card(
              child: Text('Chart goes here'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          Card(
              child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.purple,
                  onPressed: () {},
                ),
              ],
            ),
          )),
          Column(
              children: transactions.map((transaction) {
            return Card(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.purple.shade400,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    // '\$${transaction.amount}', // dollars
                    '£ ${transaction.amount}', // pounds
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple.shade400,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(transaction.date),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
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
