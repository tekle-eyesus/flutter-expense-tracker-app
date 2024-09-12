import 'package:expense_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseTitle extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  final int index;

  const ExpenseTitle(
      {super.key,
      required this.index,
      required this.name,
      required this.amount,
      required this.dateTime});

  @override
  Widget build(BuildContext context) {
    void handleYes() {
      Provider.of<ExpenseData>(context, listen: false).removeByIndex(index);
      Navigator.pop(context);
    }

    void handleNo() {
      Navigator.pop(context);
    }

    void delete() {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text("Confirmation"),
                content: Text("Are you sure to delete?"),
                actions: [
                  Row(
                    children: [
                      TextButton(onPressed: handleYes, child: Text("yes")),
                      TextButton(onPressed: handleNo, child: Text("No"))
                    ],
                  )
                ],
              )));
    }

    return Consumer<ExpenseData>(
        builder: ((context, value, child) => Container(
              margin: EdgeInsets.only(
                top: 5,
                right: 10,
                left: 10,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 23, 11, 12),
                    Color.fromARGB(255, 137, 25, 25)
                  ], begin: Alignment.topLeft, end: Alignment.topRight)),
              child: ListTile(
                leading: MaterialButton(
                    minWidth: 1,
                    onPressed: delete,
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                title: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  '${dateTime.day} / ${dateTime.month} / ${dateTime.year} ',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Text(
                  amount,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )));
  }
}
