import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/transaction.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction>? recentTransactions;

  ChartWidget(this.recentTransactions);

  List<Map<String, dynamic>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (int i = 0; i < recentTransactions!.length; i++) {
        if (recentTransactions![i].date!.day == weekDay.day &&
            recentTransactions![i].date!.month == weekDay.month &&
            recentTransactions![i].date!.year == weekDay.year) {
              totalSum += recentTransactions![i].amount!*recentTransactions![i].price! ;
            }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum,
      };
    });
  }
  double expensesAlloverWeek(){
    double totalExpenses=0;
    for(int i=0;i<groupedTransaction.length;i++){
      totalExpenses += groupedTransaction[i]['amount'];
    }
    return totalExpenses;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: ListView.builder(
          
          scrollDirection: Axis.horizontal,
          itemCount: groupedTransaction.length,
          itemBuilder: (contex,index){
            return  Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.055, 20, MediaQuery.of(context).size.width*0.055, 10),
          height: 20,
          child: FittedBox(
            child: Text('${groupedTransaction[index]['amount']} L.E'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: expensesAlloverWeek()==0? 0 : groupedTransaction[index]['amount']/expensesAlloverWeek(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(groupedTransaction[index]['day']),
      ],
    )
              //  ChartBar(
              //   data['day'],
              //   data['amount'],
              //   totalSpending == 0.0
              //       ? 0.0
              //       : (data['amount'] as double) / totalSpending,
              // ),
            );
            // Text('${groupedTransaction[index]['day']} ${groupedTransaction[index]['amount']}');
          },
        ),
      ),
    );
  }
}
