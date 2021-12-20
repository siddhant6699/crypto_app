import 'package:crypto_app/crypto_page_responce.dart';

abstract class DetailCryptoState {}

class DetailCryptoInitial extends DetailCryptoState {}

class DetailCryptoLoadInProgress extends DetailCryptoState {}

class DetailCryptoPageLoadSuccess extends DetailCryptoState {
  final marketCap;
  final numberOfMarkets;
  final volume;
  
  DetailCryptoPageLoadSuccess({required this.marketCap,required this.volume,required this.numberOfMarkets});
}
class DetailCryptoPageLoadFailed extends DetailCryptoState {
  final error;
  DetailCryptoPageLoadFailed({required this.error});
}
