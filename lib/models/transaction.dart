import 'package:flutter/material.dart';

class Transaction {
  final int? id;
  final String? title;
  final double? price;
  final double? amount;
  final DateTime? date;
   Transaction({
     @required this.id,
     @required this.title,
     @required this.price,
     @required this.amount,
     @required this.date
     });
    String? titleInput ;
    String? priceInput ;
    String? amountInput ;
}