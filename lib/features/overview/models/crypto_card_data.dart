class CryptoCardData {
  String imageUrl;
  String name;
  double currentPrice;
  double high24H;
  double low24H;
  double priceChangePercentage24H;
  DateTime lastUpdated;

  CryptoCardData.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image'];
    name = json['name'];
    currentPrice = double.parse('${json['current_price']}');
    high24H = double.parse('${json['high_24h']}');
    low24H = double.parse('${json['low_24h']}');
    priceChangePercentage24H =
        double.parse('${json['price_change_percentage_24h']}');
    lastUpdated = DateTime.parse(json['last_updated']);
  }
}
