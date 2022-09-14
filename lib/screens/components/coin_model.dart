import 'package:flutter/material.dart';

class CoinModel {
  String? name;
  String? symbol;
  String? image;
  num? current_price;
  num? price_change_24h;
  num? price_change_percentage_24h;

  CoinModel(
      {required this.name,
      required this.symbol,
      required this.image,
      required this.current_price,
      required this.price_change_24h,
      required this.price_change_percentage_24h});

  factory CoinModel.fromJson(Map<String, dynamic> data) {
    return CoinModel(
        name: data['name'],
        symbol: data['symbol'],
        image: data['image'],
        current_price: data['current_price'],
        price_change_24h: data['price_change_24h'],
        price_change_percentage_24h: data['price_change_percentage_24h']);
  }
}
