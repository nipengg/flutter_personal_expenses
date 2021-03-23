// Output File

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delete;

  TransactionList(this.transactions, this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transaction added yet..', style: Theme.of(context).textTheme.title,),
                SizedBox(height: 20,),
                Container(height: 200, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30, 
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(child: Text('\Rp.${transactions[index].amount}')),
                      ),
                    ),
                    title: Text(transactions[index].title, style: Theme.of(context).textTheme.title,),
                    subtitle: Text(DateFormat().format(transactions[index].date)),
                    trailing: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => delete(transactions[index].id),),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
