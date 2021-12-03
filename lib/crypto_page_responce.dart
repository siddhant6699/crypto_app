// {
//   "status": "success",
//   "data": {
//     "stats": {
//       "total": 3,
//       "totalCoins": 10000,
//       "totalMarkets": 35000,
//       "totalExchanges": 300,
//       "totalMarketCap": "239393904304",
//       "total24hVolume": "503104376.06373006"
//     },
//     "coins": [
//       {
//         "uuid": "Qwsogvtv82FCd",
//         "symbol": "BTC",
//         "name": "Bitcoin",
//         "color": "#f7931A",
//         "iconUrl": "https://cdn.coinranking.com/Sy33Krudb/btc.svg",
//         "marketCap": "159393904304",
//         "price": "9370.9993109108",
//         "btcPrice": "1",
//         "listedAt": 1483228800,
//         "change": "-0.52",
//         "rank": 1,
//         "sparkline": [
//           "9515.0454185372",
//           "9370.9993109108"
//         ],
//         "coinrankingUrl": "https://coinranking.com/coin/Qwsogvtv82FCd+bitcoin-btc"`,
//         "24hVolume": "6818750000"
//       }
//     ]
//   }
// }
import 'package:flutter/material.dart';

class CryptoListing {
  final symbol;
  final name;
  final logo;
  final change;
  final price;

  // final String? color;

  CryptoListing({required this.symbol, required this.name, required this.logo, required this.change, required this.price});

  factory CryptoListing.fromJson(Map<String, dynamic> json) {

    final name = json['name'];
    final symbol = json['symbol'];
    final String logo=json['iconUrl'];
    final String change=json['change'];
    final price=json['price'];

    // final color = json['color'];
    return CryptoListing(name: name, symbol: symbol,logo: logo, change:change,price: price);
  }
}

class CryptoPageResponce {
  final List<CryptoListing> cryptolisting;

  CryptoPageResponce({required this.cryptolisting});

  factory CryptoPageResponce.fromJson(Map<String, dynamic> json) {
    final cryptolisting = (json['data']['coins'] as List)
        .map((listingjson) => CryptoListing.fromJson(listingjson))
        .toList();
    return CryptoPageResponce(cryptolisting: cryptolisting);
  }
}
