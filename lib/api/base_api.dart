import 'package:cryptotracker/app/settings/currencies.dart';
import 'package:dio/dio.dart';

class BaseApi {
  static const BASE_URL = 'https://api.coingecko.com/api/v3';
  static const COIN_ENDPOINT = '/coins';
  static const LIST_ENDPOINT = '/${COIN_ENDPOINT}/markets';
  static final _options = BaseOptions(baseUrl: BASE_URL);
  static final _dioInstance = Dio(_options);

  Future<List<Map<String, dynamic>>> getOverviewList(String currency) async {
    final result = await _dioInstance.get(LIST_ENDPOINT, queryParameters: {
      'vs_currency': currency,
      'ids': kCryptoCurrencies.join(',')
    });
    return List<Map<String, dynamic>>.from(result.data);
  }

  // Get historical market data include price, market cap, and 24h volume (granularity auto)
  // Minutely data will be used for duration within 1 day,
  // Hourly data will be used for duration between 1 day and 90 days,
  // Daily data will be used for duration above 90 days.
  Future<Map<String, dynamic>> getDetail(
      {String coin,
      String currency,
      int range = 7,
      String interval = 'daily'}) async {
    final result = await _dioInstance.get('$COIN_ENDPOINT/$coin/market_chart',
        queryParameters: {
          'vs_currency': currency,
          'days': range,
          'interval': interval
        });
    return Map<String, dynamic>.from(result.data);
  }
}
