import 'package:cryptotracker/features/overview/api/base_api.dart';
import 'package:cryptotracker/features/overview/models/crypto_card_data.dart';

class OverviewService {
  final _api = BaseApi();

  Future<List<CryptoCardData>> getOverviewList(String currency) async {
    final response = await _api.getOverviewList(currency);
    return response.map((el) => CryptoCardData.fromJson(el)).toList();
  }
}
