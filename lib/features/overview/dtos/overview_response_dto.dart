import 'package:json_annotation/json_annotation.dart';

part 'overview_response_dto.g.dart';

@JsonSerializable()
class OverviewResponseDTO {
  final String id;
  final String symbol;
  @JsonKey(name: 'image')
  final String imageUrl;
  final String name;
  @JsonKey(name: 'current_price')
  final double currentPrice;
  @JsonKey(name: 'high_24h')
  final double high24H;
  @JsonKey(name: 'low_24h')
  final double low24H;
  @JsonKey(name: 'price_change_24h')
  final double priceChange24H;
  @JsonKey(name: 'price_change_percentage_24h')
  final double priceChangePercentage24H;
  @JsonKey(name: 'last_updated')
  final DateTime lastUpdated;
  @JsonKey(name: 'market_cap')
  final int marketCap;
  @JsonKey(name: 'market_cap_rank')
  final int marketCapRank;
  @JsonKey(name: 'market_cap_change_24h')
  final double marketCapChange24h;
  @JsonKey(name: 'market_cap_change_percentage_24h')
  final double marketCapChangePercentage24h;
  @JsonKey(name: 'fully_diluted_valuation')
  final double fullyDilutedValuation;
  @JsonKey(name: 'total_volume')
  final int totalVolume;
  @JsonKey(name: 'circulating_supply')
  final double circulatingSupply;
  @JsonKey(name: 'total_supply')
  final double totalSupply;
  @JsonKey(name: 'max_supply')
  final double maxSupply;
  final double ath;
  final double atl;
  @JsonKey(name: 'ath_change_percentage')
  final double athChangePercentage;
  @JsonKey(name: 'atl_change_percentage')
  final double atlChangePercentage;
  @JsonKey(name: 'ath_date')
  final DateTime athDate;
  @JsonKey(name: 'atl_date')
  final DateTime atlDate;

  OverviewResponseDTO(
      this.id,
      this.symbol,
      this.imageUrl,
      this.name,
      this.currentPrice,
      this.high24H,
      this.low24H,
      this.priceChange24H,
      this.priceChangePercentage24H,
      this.lastUpdated,
      this.marketCap,
      this.marketCapRank,
      this.marketCapChange24h,
      this.marketCapChangePercentage24h,
      this.fullyDilutedValuation,
      this.totalVolume,
      this.circulatingSupply,
      this.totalSupply,
      this.maxSupply,
      this.ath,
      this.atl,
      this.athChangePercentage,
      this.atlChangePercentage,
      this.athDate,
      this.atlDate);

  factory OverviewResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$OverviewResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$OverviewResponseDTOToJson(this);
}
