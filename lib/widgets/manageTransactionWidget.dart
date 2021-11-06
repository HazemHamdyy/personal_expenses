import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/addTransactionWidget.dart';
import 'package:flutter_application_2/widgets/transactionWidget.dart';
import 'package:flutter_application_2/models/transaction.dart';

class ManageTransactionWidget extends StatefulWidget {
  const ManageTransactionWidget({ Key? key }) : super(key: key);

  @override
  _ManageTransactionWidgetState createState() => _ManageTransactionWidgetState();
}

class _ManageTransactionWidgetState extends State<ManageTransactionWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      margin: EdgeInsets.all(10),
      child: ListView(
        children: [
         
        ],
      ),
      
    );
  }
}