import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:price_bitcoin_app/app/controllers/home_controller.dart';
import 'package:price_bitcoin_app/app/models/home_model.dart';
import 'package:price_bitcoin_app/app/repository/home_repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeRepository home = HomeRepository();
  HomeModel model = HomeModel();
  HomeController control = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BITCOIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Lottie.asset('assets/bitcoin.json'),
          Text(
            model.buy == null ? '' : 'R\$ ${convertValue(model.buy!)}',
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 50),
          IconButton(
            onPressed: () async {
              model = await control.getCurrency(context);
              setState(() {});
            },
            icon: Icon(
              Icons.attach_money,
              size: 50,
              color: Colors.yellow.shade700,
            ),
          )
        ],
      ),
    );
  }

  String convertValue(double value) {
    String convert = value.toString();
    return convert.replaceAll('.', ',');
  }
}
