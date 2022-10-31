import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:price_bitcoin_app/app/models/home_model.dart';

class HomeRepositoryReturn {
  final HomeModel? logado;
  final String? errorMessage;

  HomeRepositoryReturn({this.logado, this.errorMessage});
}

class HomeRepository {
  Future<HomeRepositoryReturn> searchPrice() async {
    String url = "https://blockchain.info/ticker";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      return HomeRepositoryReturn(logado: HomeModel.fromJson(result['BRL']));
    } else {
      return HomeRepositoryReturn(errorMessage: 'Error');
    }
  }
}
