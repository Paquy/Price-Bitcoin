import 'package:flutter/material.dart';

import '../models/home_model.dart';
import '../repository/home_repository.dart';

class HomeController {
  HomeRepository home = HomeRepository();

  Future<HomeModel> getCurrency(BuildContext context) async {
    final HomeRepositoryReturn response = await home.searchPrice();
    if (response.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error',
            textAlign: TextAlign.center,
          ),
        ),
      );
      throw 'Error';
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Updated value',
            textAlign: TextAlign.center,
          ),
        ),
      );
      return response.logado!;
    }
  }
}
