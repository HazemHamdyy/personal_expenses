import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/transaction.dart';
import 'package:intl/intl.dart';

class AddTransactionWidget extends StatefulWidget {
  final Function? addNewTransaction;

  AddTransactionWidget(this.addNewTransaction);

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  final amountController = TextEditingController();
    DateTime? _selectedDate;
  


   void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            controller: priceController,
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
           Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
          TextButton(
            onPressed: () {
              widget.addNewTransaction!(
                  title: titleController.text,
                  amount: double.parse(amountController.text),
                  price: double.parse(priceController.text),
                  date : _selectedDate
                 
                  );
                  Navigator.of(context).pop();
            },
            child: Text('Add Transaction'),
          )
        ],
      ),
    ));
  }
}
