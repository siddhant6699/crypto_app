class CryptoListing {
  final symbol;
  final name;
  final logo;
  final change;
  final price;
  final sparkline;
  final uuid;

  CryptoListing(
      {required this.symbol,
      required this.name,
      required this.logo,
      required this.change,
      required this.price,
      required this.sparkline,
      required this.uuid});

  factory CryptoListing.fromJson(Map<String, dynamic> json) {
    //print('in formListing');
    final name = json['name'];
    final symbol = json['symbol'];
    final String logo = json['iconUrl'];
    final String change = json['change'];
    final price = json['price'];
    final sparkline = json['sparkline'];
    final uuid = json['uuid'];

    return CryptoListing(
      name: name,
      symbol: symbol,
      logo: logo,
      change: change,
      price: price,
      sparkline: sparkline,
      uuid: uuid,
    );
  }
}

class DetailedCryptoListing {
  final sparkline;
  final uuid;
  final marketCap;
  final numberOfMarkets;
  final volume;

  DetailedCryptoListing(
      {required this.sparkline,
      required this.uuid,
      required this.marketCap,
      required this.numberOfMarkets,
      required this.volume});

  factory DetailedCryptoListing.fromJson(Map<String, dynamic> json) {
    final sparkline = json['data']['coin']['sparkline'];
    final uuid = json['data']['coin']['uuid'];
    final marketCap = json['data']['coin']['marketCap'];
    final numberOfMarkets = json['data']['coin']['numberOfMarkets'];
    final volume = json['data']['coin']['24hVolume'];

    return DetailedCryptoListing(
      sparkline: sparkline,
      uuid: uuid,
      marketCap: marketCap,
      numberOfMarkets: numberOfMarkets,
      volume: volume,
    );
  }
}

// class DetailedCryptoPage {
//   final List<DetailedCryptoListing> cryptolisting;

//   DetailedCryptoPage({required this.cryptolisting});

//   factory DetailedCryptoPage.fromJson(Map<String, dynamic> json) {
//     print('in fromJSON');
//     final cryptolisting = (json['data'] as List)
//         .map((listingjson) => DetailedCryptoListing.fromJson(listingjson))
//         .toList();

//     return DetailedCryptoPage(cryptolisting: cryptolisting);
//   }
// }

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
