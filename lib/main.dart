import 'package:flutter/material.dart';
import 'cryptoview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowMaterialGrid:false,
      // theme: ThemeData(
      //   // brightness: Brightness.light,
      // ),
      //darkTheme: ThemeData.dark(),
        // brightness: Brightness.dark,
      
      //themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: CryptoView(),
      // home: MultiBlocProvider(
      //     providers: [BlocProvider(create: (context) => CryptoBloc())],
      //     child: CryptoView()),
    );
  }
}
