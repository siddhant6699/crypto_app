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
  final int uuid;
  final String name;

  CryptoListing({required this.uuid, required this.name});

  factory CryptoListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final uuid = json['uuid'];
    return CryptoListing(name: name, uuid: uuid);
  }
}

class CryptoPageResponce {
  final List<CryptoListing> cryptolisting;

  CryptoPageResponce({required this.cryptolisting});

  factory CryptoPageResponce.fromJson(Map<String, dynamic> json) {
    final cryptolisting = (json['coins'] as List)
        .map((listingjson) => CryptoListing.fromJson(listingjson))
        .toList();
    return CryptoPageResponce(cryptolisting: cryptolisting);
  }
}
