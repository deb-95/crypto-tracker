import 'package:json_annotation/json_annotation.dart';

part 'detail_response_dto.g.dart';

@JsonSerializable()
class DetailResponseDTO {
  final List<List<dynamic>> prices;
  @JsonKey(name: 'market_caps')
  final List<List<dynamic>> marketCaps;
  @JsonKey(name: 'total_volumes')
  final List<List<dynamic>> totalVolumes;

  DetailResponseDTO({this.prices, this.marketCaps, this.totalVolumes});

  factory DetailResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$DetailResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DetailResponseDTOToJson(this);
}
