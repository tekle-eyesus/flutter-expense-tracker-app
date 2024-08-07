import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on sell
  final List _shopItemsList = [
    //[itemname,itemPath,itemPrice,color]
    ["phone", "200", "lib/images/iphone-x.png", Colors.green],
    [
      "laptop",
      "450",
      "lib/images/laptop.png",
      Color.fromARGB(255, 173, 136, 81),
    ],
    [
      "HeadSet",
      "50",
      "lib/images/headset.png",
      Color.fromARGB(255, 10, 68, 160),
    ],
    [
      "Micro Wave",
      "550",
      "lib/images/microwave.png",
      Color.fromARGB(255, 220, 203, 16),
    ],
    [
      "Orange",
      "12",
      "lib/images/orange.png",
      Color.fromARGB(255, 118, 117, 104),
    ],
    [
      "Mango",
      "15",
      "lib/images/mango.png",
      Color.fromARGB(255, 146, 138, 46),
    ],
    [
      "T-shirt",
      "60",
      "lib/images/tshirt.png",
      Color.fromARGB(255, 47, 100, 129),
    ],
    [
      "wine",
      "37",
      "lib/images/wine.png",
      Color.fromARGB(255, 112, 16, 40),
    ],
    [
      "Shoes",
      "220",
      "lib/images/shoes.png",
      Color.fromARGB(255, 144, 102, 212),
    ],
    [
      "pen",
      "2",
      "lib/images/pen.png",
      Color.fromARGB(255, 241, 223, 179),
    ],
  ];

  //list of added cards
  List cartList = [];

//getter to ruturn lists

  get shopItems => _shopItemsList;
  get cartItem => cartList;

  void addItemToCart(int index) {
    cartList.add(_shopItemsList[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    cartList.removeAt(index);
    notifyListeners();
  }

  String calculateItemPrice() {
    double totalPrice = 0;
    for (int i = 0; i < cartList.length; i++) {
      totalPrice += int.parse(cartList[i][1]); //the index of the price is 1
    }
    return totalPrice.toStringAsFixed(2);
  }

//to calculate the total number of items in the cart
  String calculateTotalItems() {
    int count = 0;
    for (int i = 0; i < cartList.length; i++) {
      count++;
    }

    return count.toString();
  }
}
