import 'package:cached_network_image/cached_network_image.dart';
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
          backgroundColor: Colors.black38,
          title: const Text('Crypto Eye'),
        ),
        body: BlocBuilder<CryptoBloc, CryptoState>(builder: (context, state) {
          if (state is CryptoLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CryptoPageLoadSuccess) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView.builder(
                  itemCount: state.cryptoListings.length,
                  itemBuilder: (context, index) {
                    // String color;
                    // if (state.cryptoListings[index].color != null) {
                    //   color =
                    //       (state.cryptoListings[index].color)!;
                    //   print(color);
                    // }
                    // else{
                    //   color="#ffffff";
                    // }
                    double price =
                        double.parse(state.cryptoListings[index].price);
                    String url = state.cryptoListings[index].logo;
                    String logo = url.replaceAll(".svg", ".png");
                    return Card(
                      // color: const Color(0XFF3C3C3D),
                      child: ListTile(
                        leading: CachedNetworkImage(
                            height: 50,
                            width: 50,
                            imageUrl: logo,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator()),
                        // leading: Image(
                        //        height: 50,
                        //        width: 50,
                        //        image: NetworkImage(logo),
                        //        // image: NetworkImage(state.cryptoListings[index].logo),
                        //      ),
                        title: Text(
                          state.cryptoListings[index].name,
                          style: const TextStyle(fontSize: 17),
                        ),
                        subtitle: Row(
                          children: [
                            Text(state.cryptoListings[index].symbol),
                            const SizedBox(width: 8.0),
                            ((state.cryptoListings[index].change)[0] == "-")
                                ? Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_downward,
                                        color: Colors.red,
                                        size: 15,
                                      ),
                                      Text(
                                        ((state.cryptoListings[index].change)
                                            .replaceAll("-", "")),
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_upward,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                      Text(
                                        (state.cryptoListings[index].change),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        trailing: Text(
                          "\$${(price).toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // child: Column(
                        //   children: [
                        //     Image(
                        //       height: 50,
                        //       width: 50,
                        //       image: NetworkImage(logo),
                        //       // image: NetworkImage(state.cryptoListings[index].logo),
                        //     ),
                        //     Text(state.cryptoListings[index].symbol),
                        //     Text(state.cryptoListings[index].name),
                        //   ],
                        // ),
                      ),
                    );
                  }),
            );
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
// import 'package:crypto_app/bloc/crypto_bloc.dart';
// import 'package:crypto_app/bloc/crypto_state.dart';
// import 'package:crypto_app/extentions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'bloc/crypto_event.dart';

// class CryptoView extends StatefulWidget {
//   const CryptoView({Key? key}) : super(key: key);

//   @override
//   State<CryptoView> createState() => _CryptoViewState();
// }

// class _CryptoViewState extends State<CryptoView> {
// // @override
// //   void initState() {
// //     BlocProvider.of<CryptoBloc>(context).add(CryptoPageRequest());
// //     // TODO: implement initState
// //     super.initState();
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CryptoBloc()..add(CryptoPageRequest()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Crypto Eye'),
//         ),
//         body: BlocBuilder<CryptoBloc, CryptoState>(builder: (context, state) {
//           if (state is CryptoLoadInProgress) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is CryptoPageLoadSuccess) {
//             return GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3),
//                 itemCount: state.cryptoListings.length,
//                 itemBuilder: (context, index) {
//                   // String color;
//                   // if (state.cryptoListings[index].color != null) {
//                   //   color =
//                   //       (state.cryptoListings[index].color)!;
//                   //   print(color);
//                   // }
//                   // else{
//                   //   color="#ffffff";
//                   // }
//                   String url=state.cryptoListings[index].logo;
//                   String logo=url.replaceAll(".svg",".png");
//                   return Card(
//                     color: const Color(0XFF3C3C3D),
//                     child: GridTile(
//                       child: Column(
//                         children: [
//                           Image(
//                             height: 50,
//                             width: 50,
//                             image: NetworkImage(logo),
//                             // image: NetworkImage(state.cryptoListings[index].logo),
//                           ),
//                           Text(state.cryptoListings[index].symbol),
//                           Text(state.cryptoListings[index].name),
//                         ],
//                       ),
//                     ),
//                   );
//                 });
//           } else if (state is CryptoPageLoadFailed) {
//             return Center(
//                 child: Text(
//               state.error.toString(),
//             ));
//           } else {
//             return const Center(
//               child: Text('All went wrong'),
//             );
//           }
//         }),
//       ),
//     );
//   }
// }
