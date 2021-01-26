import 'package:cryptotracker/api/base_api.dart';
import 'package:cryptotracker/features/detail/dtos/detail_response_dto.dart';

class DetailService {
  final _api = BaseApi();

  Future<DetailResponseDTO> getDetailList(
      {String coin, String currency}) async {
    final response = await _api.getDetail(coin: coin, currency: currency);
    return DetailResponseDTO.fromJson(response);
  }
}
