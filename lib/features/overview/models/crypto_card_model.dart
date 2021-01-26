import 'package:cryptotracker/features/overview/dtos/overview_response_dto.dart';

class CryptoCardVM {
  final String id;
  final String imageUrl;
  final String name;
  final double currentPrice;
  final double high24H;
  final double low24H;
  final double priceChangePercentage24H;
  final DateTime lastUpdated;

  CryptoCardVM(
      {this.id,
      this.imageUrl,
      this.name,
      this.currentPrice,
      this.high24H,
      this.low24H,
      this.priceChangePercentage24H,
      this.lastUpdated});

  factory CryptoCardVM.fromDTO(OverviewResponseDTO dto) {
    return CryptoCardVM(
        id: dto.id,
        imageUrl: dto.imageUrl,
        name: dto.name,
        currentPrice: dto.currentPrice,
        high24H: dto.high24H,
        low24H: dto.low24H,
        priceChangePercentage24H: dto.priceChangePercentage24H,
        lastUpdated: dto.lastUpdated);
  }
}
