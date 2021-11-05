import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    // converts to a double. need to handle error if string is passed
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

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
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            // onChanged: (value) {
            //   amountInput = value;
            // },
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
          ),
          FlatButton(
            child: Text('Add Transaction'),
            textColor: Colors.purple,
            onPressed: submitData,
          ),
        ],
      ),
    ));
  }
}
