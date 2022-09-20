import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class TransactionList extends StatelessWidget {
  final List<Transcation> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
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
                        child: Text('${transactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(
                      transactions[index].date,
                    ),
                    style: TextStyle(color: secondaryColor),
                  ),
                  trailing: mediaQuery.size.width > 460
                      ? ElevatedButton.icon(
                          onPressed: () =>
                              deleteTransaction(transactions[index].id),
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
                              deleteTransaction(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
