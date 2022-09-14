import 'package:flutter/material.dart';

Widget ListContainer(
    {String? name,
    String? image,
    String? symbol,
    num? current_price,
    num? price_change_24h,
    num? price_change_percentage_24h}) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(4, 4),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 14),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(5, 5),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Image.network(image.toString()),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name.toString()),
              Text(
                symbol.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                current_price.toString(),
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                price_change_24h!.toStringAsFixed(9),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: price_change_24h < 0 ? Colors.red : Colors.green),
              ),
              Text(
                '${price_change_percentage_24h.toString()}%',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: price_change_percentage_24h! < 0
                        ? Colors.red
                        : Colors.green),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
