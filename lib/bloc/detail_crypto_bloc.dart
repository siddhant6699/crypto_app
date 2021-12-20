import 'package:crypto_app/bloc/detail_crypto_event.dart';
import 'package:crypto_app/bloc/detail_crypto_state.dart';
import 'package:crypto_app/crypto_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCryptoBloc extends Bloc<DeatailCryptoEvent, DetailCryptoState> {
  final _cryptoRepository = CryptoRepository();

  DetailCryptoBloc() : super(DetailCryptoInitial());
  @override
  Stream<DetailCryptoState> mapEventToState(DeatailCryptoEvent event) async* {
    if (event is DetailCryptoPageRequest) {
      yield DetailCryptoLoadInProgress();

      try {
        // final cryptoPageResponce=await _cryptoRepository.getCryptoPage();
        final cryptoPageResponce24 =
            await _cryptoRepository.getDetailedCrypto(event.uuid, '7d');
        yield DetailCryptoPageLoadSuccess(
            marketCap: cryptoPageResponce24.marketCap,
            numberOfMarkets: cryptoPageResponce24.numberOfMarkets,
            volume: cryptoPageResponce24.volume);
      } catch (e) {
        yield DetailCryptoPageLoadFailed(error: e);
      }
    }
  }
}
