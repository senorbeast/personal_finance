import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance/models/Transaction.dart';

class TransactionTable extends StatelessWidget {
  final List<Transaction?>? transactions;

  TransactionTable({required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions == null || transactions!.isEmpty) {
      return const Text('No transactions available.');
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 5,
          columns: const [
            DataColumn(label: Text('Amount')),
            DataColumn(label: Text('Datetime')),
            DataColumn(label: Text('Other Account')),
            DataColumn(label: Text('User ID')),
          ],
          rows: transactions!
              .where((transaction) => transaction != null)
              .map((transaction) {
            if (transaction != null) {
              final formattedDatetime =
                  _formatTemporalDateTime(transaction.datetime);

              return DataRow(
                cells: [
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: Text(transaction.amount.toString()),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: Text(formattedDatetime),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: Text(transaction.otherAccount),
                    ),
                  ),
                  DataCell(
                    Align(
                      alignment: Alignment.center,
                      child: Text(transaction.userID),
                    ),
                  ),
                ],
              );
            } else {
              // Handle the case where a transaction is null (if any)
              return const DataRow(
                cells: [
                  DataCell(
                      Align(alignment: Alignment.center, child: Text('N/A'))),
                  DataCell(
                      Align(alignment: Alignment.center, child: Text('N/A'))),
                  DataCell(
                      Align(alignment: Alignment.center, child: Text('N/A'))),
                  DataCell(
                      Align(alignment: Alignment.center, child: Text('N/A'))),
                ],
              );
            }
          }).toList(),
        ),
      ),
    );
  }

  String _formatTemporalDateTime(TemporalDateTime temporalDateTime) {
    // Convert TemporalDateTime to DateTime
    final dateTime = DateTime.parse(temporalDateTime.toString());

    // Format DateTime using DateFormat
    return DateFormat.yMd().add_jms().format(dateTime);
  }
}
