import 'package:cryptotracker/app/settings/currencies.dart';
import 'package:dio/dio.dart';

class BaseApi {
  static const BASE_URL = 'https://api.coingecko.com/api/v3';
  static const LIST_ENDPOINT = '/coins/markets';
  static final _options = BaseOptions(baseUrl: BASE_URL);
  static final _dioInstance = Dio(_options);

  Future<List<Map<String, dynamic>>> getOverviewList(String currency) async {
    final result = await _dioInstance.get(LIST_ENDPOINT, queryParameters: {
      'vs_currency': currency,
      'ids': kCryptoCurrencies.join(',')
    });
    return List<Map<String, dynamic>>.from(result.data);
  }
}
