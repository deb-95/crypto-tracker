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
    currentPrice = json['current_price'];
    high24H = json['high_24h'];
    low24H = json['low_24h'];
    priceChangePercentage24H = json['price_change_percentage_24h'];
    lastUpdated = DateTime.parse(json['last_updated']);
  }
}
