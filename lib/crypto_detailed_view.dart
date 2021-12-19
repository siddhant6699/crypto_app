import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'crypto_repository.dart';

class CryptoDetailView extends StatefulWidget {
  final data;
  final name;
  final price;
  final url;
  final change;
  final uuid;
  CryptoDetailView(
      {Key? key,
      required this.data,
      required this.name,
      required this.price,
      required this.url,
      required this.change,
      required this.uuid})
      : super(key: key);

  @override
  State<CryptoDetailView> createState() => _CryptoDetailViewState();
}

class _CryptoDetailViewState extends State<CryptoDetailView> {
  final _cryptoRepository = CryptoRepository();

  List<num> sparklineData = [];
  var marketCap;
  var numberOfMarkets;
  var volume;

  Future<void> marketData() async {
    final cryptoPageResponce24 =
        await _cryptoRepository.getDetailedCrypto(widget.uuid, '7d');
    marketCap = gen(cryptoPageResponce24.marketCap);
    volume = gen(cryptoPageResponce24.volume);
    //numberOfMarkets = gen(cryptoPageResponce24.numberOfMarkets);
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    CircularProgressIndicator();
    marketData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.data.length; i++) {
      sparklineData.add(double.parse(widget.data[i]));
    }
    //print(sparklineData);
    double rate = double.parse(widget.price);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1C1C1E),
        title: const Text('Crypto Eye'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0XFF1C1C1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 55,
                width: 65,
                imageUrl: widget.url,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(
                widget.name,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                "\$${(rate).toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 17, color: Colors.white70),
              ),
              (widget.change[0] == "-")
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.red,
                          size: 30,
                        ),
                        Text(
                          ((widget.change).replaceAll("-", "")) + "%",
                          style:
                              const TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_drop_up_outlined,
                          color: Colors.green,
                          size: 30,
                        ),
                        Text(
                          ((widget.change).replaceAll("-", "")) + "%",
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 9,
              ),
              SfSparkLineChart(
                trackball: const SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap,
                ),
                data: sparklineData,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          getsparkdata('24h');
                        },
                        child: Text('24h')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          getsparkdata('7d');
                        },
                        child: Text('7d')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          getsparkdata('30d');
                        },
                        child: Text('30d')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          getsparkdata('1y');
                        },
                        child: Text('1y')),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        getsparkdata('5y');
                      },
                      child: Text('5y')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.auto_graph,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                          Text(
                            'Market Capture',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.article,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                          Text(
                            'Volume',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.search_off,
                              color: Colors.blue,
                              size: 30,
                            ),
                          ),
                          Text(
                            'No of markets',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '$marketCap',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '$volume',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          '$numberOfMarkets',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getsparkdata(var time) async {
    final cryptoPageResponce24 =
        await _cryptoRepository.getDetailedCrypto(widget.uuid, time);
    var res = cryptoPageResponce24.sparkline;
    
    //print(marketCap+'$numberOfMarkets'+'$volume');

    sparklineData = [];
    for (int i = 0; i < res.length; i++) {
      sparklineData.add(double.parse(res[i]));
    }

    setState(() {});
  }

  String gen(num) {
    print(num);
    double n=double.parse(num);
    print(n);
    if (n > 999999 && n < 999999999) {
      print('if');
      return "${(n / 1000000).toStringAsFixed(1)} Million";
    } else if (n > 999999999) {
      print('else');
      return "${(n / 1000000000).toStringAsFixed(1)} Billion";
    } else {
      print('else ese');
      return n.toStringAsFixed(1);
    }
  }
}
