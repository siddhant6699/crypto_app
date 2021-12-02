import 'package:crypto_app/bloc/crypto_event.dart';
import 'package:crypto_app/bloc/crypto_state.dart';
import 'package:crypto_app/crypto_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState>{
  final _cryptoRepository=CryptoRepository();
  
  CryptoBloc():super(CryptoInitial());
  @override
  Stream<CryptoState> mapEventToState(CryptoEvent event)async*{
    if(event is CryptoPageRequest){
      yield CryptoLoadInProgress();

      try{
        final cryptoPageResponce=await _cryptoRepository.getCryptoPage();
        yield CryptoPageLoadSuccess(cryptoListings: cryptoPageResponce.cryptolisting);
      }
      catch(e){
        yield CryptoPageLoadFailed(error: e);
      }
    }
  }
}