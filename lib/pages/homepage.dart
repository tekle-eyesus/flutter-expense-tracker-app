import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/shop_item_title.dart';
import 'package:shopping_app/pages/about_page.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/pages/intro_page.dart';
import 'package:shopping_app/pages/setting_page.dart';
import './../models/cart_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartPage();
        })),
        child: Icon(
          Icons.shopping_cart_checkout,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 67, 16, 12),
      ),
      appBar: AppBar(
        leading: PopupMenuButton(
            color: Colors.amber,
            iconColor: Colors.white,
            icon: Icon(Icons.menu_open_rounded),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("About"),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AboutScreen();
                    })),
                  ),
                  //to add popup menu items like about, setting and exit/quit
                  PopupMenuItem(
                      child: Text("setting"),
                      onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SettingScreen();
                          }))),
                  PopupMenuItem(
                    child: Text("Exit"),
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return IntroPage();
                    })),
                  ),
                ]),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 67, 16, 12),
        title: Text(
          "HOME PAGE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Tooltip(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              message: "Profile Image",
              child: Image.asset(
                "lib/images/user.png",
                height: 40,
                width: 40,
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(right: 310),
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Manage All Your Shopping🛒",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(
                color: const Color.fromARGB(255, 67, 16, 12),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.only(right: 220, left: 0),
              child: Text(
                "Select Items ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Expanded(
              child: Consumer<CartModel>(builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ShopItemTitle(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      itemPath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
