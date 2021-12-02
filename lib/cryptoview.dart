import 'package:crypto_app/bloc/crypto_bloc.dart';
import 'package:crypto_app/bloc/crypto_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/crypto_event.dart';

class CryptoView extends StatefulWidget {
  const CryptoView({Key? key}) : super(key: key);

  @override
  State<CryptoView> createState() => _CryptoViewState();
}

class _CryptoViewState extends State<CryptoView> {
// @override
//   void initState() {
//     BlocProvider.of<CryptoBloc>(context).add(CryptoPageRequest());
//     // TODO: implement initState
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoBloc()..add(CryptoPageRequest()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Eye'),
        ),
        body: BlocBuilder<CryptoBloc, CryptoState>(builder: (context, state) {
          if (state is CryptoLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CryptoPageLoadSuccess) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: state.cryptoListings.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: GridTile(
                      child: Column(
                        children: [Text(state.cryptoListings[index].name)],
                      ),
                    ),
                  );
                });
          } else if (state is CryptoPageLoadFailed) {
            return Center(
                child: Text(
              state.error.toString(),
            ));
          } else {
            return const Center(
              child: Text('All went wrong'),
            );
          }
        }),
      ),
    );
  }
}
