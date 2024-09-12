import 'package:expense_tracker/components/expense_title.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:expense_tracker/screens/about_screen.dart';
import 'package:expense_tracker/screens/intro_screen.dart';
import 'package:expense_tracker/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;

  void handleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  //text controllers to textfields
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  //add new expense
  void addNewExpense() {
    // to display the dialog box
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add new Expense"),
        content: Column(
          //to reduce the size of column
          mainAxisSize: MainAxisSize.min,
          children: [
            //expense name
            TextField(
              decoration: InputDecoration(hintText: "Expense Name"),
              //from the above controllers
              controller: newExpenseNameController,
            ),
            // to add expense amount
            TextField(
              keyboardType:
                  TextInputType.number, //to change the keyboard to number
              decoration: InputDecoration(hintText: "Amount In ETB"),
              controller: newExpenseAmountController,
            ),
          ],
        ),
        //buttons
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text("save"),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text("Cancel"),
          )
        ],
      ),
    );
  }

  void save() {
    if (newExpenseNameController.text.isNotEmpty &&
        newExpenseAmountController.text.isNotEmpty) {
      ExpenseItem newExpense = ExpenseItem(
          name: newExpenseNameController.text,
          amount: newExpenseAmountController.text,
          dateTime: DateTime.now());
//add new expense below
      Provider.of<ExpenseData>(context, listen: false)
          .addNewExpense(newExpense);
      //po dialog after save
      Navigator.pop(context);
      clearControllers();
    } else {
      Navigator.pop(context);
      clearControllers();
    }
  }

  void cancel() {
    Navigator.pop(context);
    clearControllers();
  }

  //to clear the name and amount after save and cancel
  void clearControllers() {
    newExpenseAmountController.clear();
    newExpenseNameController.clear();
  }

  int getTotalExpense() {
    int totalAmount = 0;
    List<ExpenseItem> expenseList =
        Provider.of<ExpenseData>(context, listen: false).getAllExpenseList();
    for (var i = 0; i < expenseList.length; i++) {
      totalAmount = int.parse(expenseList[i].amount) + totalAmount;
    }

    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: PopupMenuButton(
            color: Color.fromARGB(255, 33, 33, 33),
            iconColor: Colors.white,
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.adb_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          "About",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AboutScreen();
                    })),
                  ),
                  //to add popup menu items like about, setting and exit/quit
                  PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.grey,
                          ),
                          Text("setting",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (SettingScreen())))),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        Text("Exit", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return IntroPage();
                    })),
                  ),
                  PopupMenuItem(
                    onTap: handleTheme,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          (isDark) ? Icons.light_mode : Icons.dark_mode,
                          color: Colors.white,
                        ),
                        Text((isDark) ? "Light" : "dark",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ]),
        title: Text(
          "Expense Tracker",
          style: TextStyle(
            color: Color.fromARGB(255, 235, 16, 16),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () => showSearch(
              context: context,
              delegate: CustomSearchDelegate(
                  test: Provider.of<ExpenseData>(context, listen: false)
                      .getAllExpenseList()),
            ),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ],
      ),
      body: Consumer<ExpenseData>(
          builder: ((context, value, child) => Scaffold(
                backgroundColor: (isDark)
                    ? Colors.black
                    : Color.fromARGB(255, 183, 190, 193),
                floatingActionButton: FloatingActionButton(
                  onPressed: addNewExpense,
                  tooltip: "Add New Expense",
                  backgroundColor: const Color.fromARGB(255, 30, 26, 26),
                  child: Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 235, 16, 16),
                  ),
                ),
                body: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 23, 11, 12),
                                    Color.fromARGB(255, 137, 25, 25)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight)),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 100,
                          width: 190,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Expense",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${value.getTotal()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 23, 11, 12),
                                    Color.fromARGB(255, 137, 25, 25)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.topRight)),
                          height: 100,
                          width: 190,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "This Week",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              Text(
                                "200 birr",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.getAllExpenseList().length,
                          itemBuilder: ((context, index) => ExpenseTitle(
                              index: index,
                              name: value.getAllExpenseList()[index].name,
                              amount:
                                  "${value.getAllExpenseList()[index].amount} ETB",
                              dateTime:
                                  value.getAllExpenseList()[index].dateTime))),
                    ),
                  ],
                ),
              ))),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<ExpenseItem> test;
  CustomSearchDelegate({required this.test});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ExpenseItem> expenseQuery = [];
    for (var i = 0; i < test.length; i++) {
      if (test[i].name.toLowerCase().contains(query.toLowerCase()) ||
          test[i].amount.toLowerCase().contains(query.toLowerCase()) ||
          test[i]
              .dateTime
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        expenseQuery.add(test[i]);
      }
    }

    return ListView.builder(
      itemCount: expenseQuery.length,
      itemBuilder: (context, index) {
        var result = expenseQuery[index];
        return Container(
          decoration: BoxDecoration(border: Border.all()),
          child: ListTile(
            title: Text(result.name),
            subtitle: Text(result.dateTime.toString()),
            trailing: Text(result.amount),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ExpenseItem> expQuery = [];
    for (var i = 0; i < test.length; i++) {
      if (test[i].name.toLowerCase().contains(query.toLowerCase()) ||
          test[i].amount.toLowerCase().contains(query.toLowerCase()) ||
          test[i]
              .dateTime
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        expQuery.add(test[i]);
      }
    }
    return ListView.builder(
      itemCount: expQuery.length,
      itemBuilder: (context, index) {
        var result = expQuery[index];
        return Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
              border: Border.all(),
              color: Color.fromARGB(255, 234, 234, 234),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(result.name),
            subtitle: Text(result.dateTime.toString()),
            trailing: Text("${result.amount} birr"),
          ),
        );
      },
    );
  }
}
