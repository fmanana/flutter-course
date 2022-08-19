import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_GB', null);
    return Container(
      height: 400,
      child: transactions.isEmpty
      ? Column(
        children: <Widget>[
          Text(
            'No transactions added yet!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        ],
      )
      : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container( // amount
                  child: Text(
                    '€${transactions[index].amount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 2
                    )
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text( // title
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge
                    ),
                    Text( // date
                      DateFormat.yMMMMd('en_GB').format(transactions[index].date),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}