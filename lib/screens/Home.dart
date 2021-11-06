import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/transaction.dart';
import 'package:flutter_application_2/shared/sharedFontStyle.dart';
import 'package:flutter_application_2/shared/sharedColor.dart';
import 'package:flutter_application_2/widgets/addTransactionWidget.dart';
import 'package:flutter_application_2/widgets/chartWidget.dart';
import 'package:flutter_application_2/widgets/manageTransactionWidget.dart';
import 'package:flutter_application_2/widgets/transactionWidget.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transaction> _userTransaction = [];
  void addNewTransaction({String? title, double? amount, double? price,DateTime? date}) {
    final newTransaction = Transaction(
        title: title,
        amount: amount,
        price: price,
        id: _userTransaction.length + 1,
        date: date);
    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  void removeTransaction(List tx,int index){
    setState(() {
      _userTransaction.remove(tx[index]);
    });
    
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: AddTransactionWidget(addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Personal Expenses'),
        actions: [
          IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView(
          children: [
            ChartWidget(_userTransaction),
            TransactionWidget(_userTransaction,removeTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
