import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CryptoDetailView extends StatelessWidget {
  final data;
  final name;
  final price;
  final url;
  CryptoDetailView(
      {Key? key,
      required this.data,
      required this.name,
      required this.price,
      required this.url})
      : super(key: key);

  List<num> gNum = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < data.length; i++) {
      gNum.add(double.parse(data[i]));
    }
    double rate = double.parse(price);
    return Scaffold(
      backgroundColor: const Color(0XFF161825),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 50,
                width: 60,
                imageUrl: url,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "\$${(rate).toStringAsFixed(2)}",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 9,
              ),
              SfSparkLineChart(
                trackball: const SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap,
                ),
                data: gNum,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
