import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/transaction.dart';
import 'package:flutter_application_2/shared/sharedColor.dart';
import 'package:flutter_application_2/shared/sharedFontStyle.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatefulWidget {
  final Function? removeTransaction;
  final List<Transaction>? transactions;
  TransactionWidget(this.transactions,this.removeTransaction);

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      child: widget.transactions!.isEmpty
          ? Center(
              child: Container(child: Text('There\'s no transactions here')))
          : ListView.builder(
              itemCount: widget.transactions!.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.85,
                          child: Card(
                              elevation: 5,
                              color: Colors.white54,
                              child: ListTile(
                                leading: Text(
                                  '${widget.transactions![index].id!}',
                                  style: mainTextStyle,
                                ),
                                title: Text(
                                  '${widget.transactions![index].amount!} x ${widget.transactions![index].title!}',
                                  style: mainTextStyle,
                                ),
                                subtitle: Text(
                                  DateFormat.yMMMd()
                                      .format(widget.transactions![index].date!),
                                  style: subTextStyle,
                                ),
                                trailing: Container(
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black87, width: 2)),
                                    child: Center(
                                      child: Text(
                                        '${widget.transactions![index].amount! * widget.transactions![index].price!} L.E',
                                        style: mainTextStyle,
                                      ),
                                    )),
                              )),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.08,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.removeTransaction!(widget.transactions,index);
                                  });
                                }, icon: Icon(Icons.delete)))
                      ],
                    ));
              },
            ),
    );
  }
}
