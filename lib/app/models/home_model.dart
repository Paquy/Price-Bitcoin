class HomeModel {
  double? buy;

  HomeModel({
    this.buy,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(buy: json['buy']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['buy'] = buy;
    return data;
  }
}
