// import '/datetime/date_time_helper.dart';
// import '/models/expense_item.dart';
import 'package:expense_tracker/datetime/date_time_helper.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
  //list of all expenses
  List<ExpenseItem> overallExpenseList = [];

  //get the above list

  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //to add new expenses to the List

  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
  }

  //remove an expense from the list

  void removeExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
  }

  void removeByIndex(int index) {
    overallExpenseList.removeAt(index);

    notifyListeners();
  }

  //get weekly time

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return "mon";

      case 2:
        return "Tue";

      case 3:
        return "Wed";

      case 4:
        return "Thur";

      case 5:
        return "Fri";

      case 6:
        return "Sat";

      case 7:
        return "Sun";

      default:
        return "";
    }
  }

  //get the start of the week
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get today date
    DateTime today = DateTime.now();

    //go back to find the nearest sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {
      //date(yyyymmdd : amount in that day)
    };
    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;

        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }

  int getTotal() {
    int total = 0;
    for (int i = 0; i < getAllExpenseList().length; i++) {
      total = int.parse(getAllExpenseList()[i].amount) + total;
    }
    return total;
  }
}
