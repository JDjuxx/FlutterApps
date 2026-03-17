import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class Grocery extends StatelessWidget {
  const Grocery(this.grocery, {super.key});

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(grocery.name),
      leading: Container(
        margin: EdgeInsets.all(5),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: grocery.category.color,
        ),
      ),
      trailing: Text('${grocery.quantity}'),
    );
    /*Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          //padding: EdgeInsets.all(40),
          margin: EdgeInsets.all(10),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: grocery.category.color,
          ),
        ),
        Text(
          grocery.name,
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white),
        ),
        Spacer(),
        Text(
          '${grocery.quantity}',
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );*/
  }
}
