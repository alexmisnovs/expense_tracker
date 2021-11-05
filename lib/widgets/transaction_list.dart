import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('No transactions added yet!',
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Image.asset(
                      'images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                    height: 200,
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                      child: Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          // '\$${transaction.amount}', // dollars
                          '£ ${transactions[index].amount.toStringAsFixed(2)}', // pounds
                          style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMMd()
                                .format(transactions[index].date),
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
                },
                itemCount: transactions.length,
              ));
  }
}
