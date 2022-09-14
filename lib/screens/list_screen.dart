
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'components/coin_model.dart';
import 'components/container_body.dart';
class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState(){
    super.initState();
    getCoinData();
  }

  List<CoinModel> coinList = [];
 Future<List<CoinModel>> getCoinData()async{
    var url='https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
    http.Response response =await http.get(Uri.parse(url));
    if(response.statusCode==200){
      print(response.body);
      var decodeData=jsonDecode(response.body);
      for(Map<String, dynamic> myMap in decodeData){
        coinList.add(CoinModel.fromJson(myMap));
      }
    }
    else{
      print(response.statusCode);
    }
    setState(() {
      coinList;
    });
    return coinList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency List'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
    itemCount: coinList.length,
    itemBuilder: (context, index) => ListContainer(
    name: coinList[index].name,
    symbol: coinList[index].symbol,
    image: coinList[index].image,
    current_price: coinList[index].current_price,
    price_change_24h: coinList[index].price_change_24h,
    price_change_percentage_24h: coinList[index].price_change_percentage_24h)),
      ),
    );
  }
  }

