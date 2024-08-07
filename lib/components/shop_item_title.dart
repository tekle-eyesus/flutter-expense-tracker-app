import 'package:flutter/material.dart';

class ShopItemTitle extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final Color color;
  void Function()? onPressed;

  ShopItemTitle(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemPath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              itemPath,
              height: 80,
              width: 80,
            ),
          ),
          Text(itemName),
          MaterialButton(
            splashColor: Colors.black12,
            onPressed: onPressed,
            color: color,
            child: Text(
              '\$' + itemPrice,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
