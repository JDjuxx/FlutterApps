import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                    '\$${expense.amount.toStringAsFixed(2)}'), //PUNTO DECIMAL EN ESTE CASO 2 DECIMALES
                Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    SizedBox(
                      width: 5,
                    ),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
