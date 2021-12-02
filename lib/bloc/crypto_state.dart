import 'package:crypto_app/crypto_page_responce.dart';

abstract class CryptoState {}

class CryptoInitial extends CryptoState {}

class CryptoLoadInProgress extends CryptoState {}

class CryptoPageLoadSuccess extends CryptoState {
  final List<CryptoListing> cryptoListings;
  CryptoPageLoadSuccess({required this.cryptoListings});
}

class CryptoPageLoadFailed extends CryptoState {
  final error;
  CryptoPageLoadFailed({required this.error});
}
