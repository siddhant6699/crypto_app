import 'dart:convert';
import 'package:crypto_app/crypto_page_responce.dart';
import 'package:http/http.dart' as http;

class CryptoRepository {
  final baseURL = 'api.coinranking.com';
  final client = http.Client();
  final queryParameters = {
    'timePeriod': 'coinrankingf402416bf98856f12572888a173e3bf195beadc48ed47a5e'
  };

  Future<CryptoPageResponce> getCryptoPage() async {
    final uri = Uri.https(baseURL, '/v2/coins');
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return CryptoPageResponce.fromJson(json);
  }

  Future<DetailedCryptoListing> getDetailedCrypto(var uuid, var time) async {
    final query = {'timePeriod': '$time'};
    final uri = Uri.https(baseURL, '/v2/coin/$uuid', query);
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return DetailedCryptoListing.fromJson(json);
  }
}
