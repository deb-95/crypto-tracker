// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewResponseDTO _$OverviewResponseDTOFromJson(Map<String, dynamic> json) {
  return OverviewResponseDTO(
    json['id'] as String,
    json['symbol'] as String,
    json['image'] as String,
    json['name'] as String,
    (json['current_price'] as num)?.toDouble(),
    (json['high_24h'] as num)?.toDouble(),
    (json['low_24h'] as num)?.toDouble(),
    (json['price_change_24h'] as num)?.toDouble(),
    (json['price_change_percentage_24h'] as num)?.toDouble(),
    json['last_updated'] == null
        ? null
        : DateTime.parse(json['last_updated'] as String),
    json['market_cap'] as int,
    json['market_cap_rank'] as int,
    (json['market_cap_change_24h'] as num)?.toDouble(),
    (json['market_cap_change_percentage_24h'] as num)?.toDouble(),
    (json['fully_diluted_valuation'] as num)?.toDouble(),
    json['total_volume'] as int,
    (json['circulating_supply'] as num)?.toDouble(),
    (json['total_supply'] as num)?.toDouble(),
    (json['max_supply'] as num)?.toDouble(),
    (json['ath'] as num)?.toDouble(),
    (json['atl'] as num)?.toDouble(),
    (json['ath_change_percentage'] as num)?.toDouble(),
    (json['atl_change_percentage'] as num)?.toDouble(),
    json['ath_date'] == null
        ? null
        : DateTime.parse(json['ath_date'] as String),
    json['atl_date'] == null
        ? null
        : DateTime.parse(json['atl_date'] as String),
  );
}

Map<String, dynamic> _$OverviewResponseDTOToJson(
        OverviewResponseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'image': instance.imageUrl,
      'name': instance.name,
      'current_price': instance.currentPrice,
      'high_24h': instance.high24H,
      'low_24h': instance.low24H,
      'price_change_24h': instance.priceChange24H,
      'price_change_percentage_24h': instance.priceChangePercentage24H,
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'market_cap': instance.marketCap,
      'market_cap_rank': instance.marketCapRank,
      'market_cap_change_24h': instance.marketCapChange24h,
      'market_cap_change_percentage_24h': instance.marketCapChangePercentage24h,
      'fully_diluted_valuation': instance.fullyDilutedValuation,
      'total_volume': instance.totalVolume,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'max_supply': instance.maxSupply,
      'ath': instance.ath,
      'atl': instance.atl,
      'ath_change_percentage': instance.athChangePercentage,
      'atl_change_percentage': instance.atlChangePercentage,
      'ath_date': instance.athDate?.toIso8601String(),
      'atl_date': instance.atlDate?.toIso8601String(),
    };
