import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.mediaQuery,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transcation transaction;
  final MediaQueryData mediaQuery;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: accentColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(
            transaction.date,
          ),
          style: TextStyle(color: secondaryColor),
        ),
        trailing: mediaQuery.size.width > 460
            ? ElevatedButton.icon(
                onPressed: () =>
                    deleteTransaction(transaction.id),
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                ),
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () =>
                    deleteTransaction(transaction.id),
              ),
      ),
    );
  }
}