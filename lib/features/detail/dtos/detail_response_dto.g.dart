// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailResponseDTO _$DetailResponseDTOFromJson(Map<String, dynamic> json) {
  return DetailResponseDTO(
    prices: (json['prices'] as List)?.map((e) => e as List)?.toList(),
    marketCaps: (json['market_caps'] as List)?.map((e) => e as List)?.toList(),
    totalVolumes:
        (json['total_volumes'] as List)?.map((e) => e as List)?.toList(),
  );
}

Map<String, dynamic> _$DetailResponseDTOToJson(DetailResponseDTO instance) =>
    <String, dynamic>{
      'prices': instance.prices,
      'market_caps': instance.marketCaps,
      'total_volumes': instance.totalVolumes,
    };
