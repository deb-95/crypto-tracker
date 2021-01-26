import 'package:cryptotracker/api/base_api.dart';
import 'package:cryptotracker/features/overview/dtos/overview_response_dto.dart';

class OverviewService {
  final _api = BaseApi();

  Future<List<OverviewResponseDTO>> getOverviewList(String currency) async {
    final response = await _api.getOverviewList(currency);
    return [
      for (Map<String, dynamic> el in response) OverviewResponseDTO.fromJson(el)
    ];
  }
}
