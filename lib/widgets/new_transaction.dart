import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            // onChanged: (value) {
            //   titleInput = value;
            // },
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            // onChanged: (value) {
            //   amountInput = value;
            // },
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
          ),
          FlatButton(
            child: Text('Add Transaction'),
            textColor: Colors.purple,
            onPressed: () {
              addTransaction(
                  titleController.text,
                  double.parse(amountController
                      .text)); // converts to a double. need to handle error if string is passed
              // print('Entered title: ${titleInput}');
              // print('Entered amount: ${amountInput}');
            },
          ),
        ],
      ),
    ));
  }
}
