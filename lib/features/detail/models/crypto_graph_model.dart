import 'package:cryptotracker/features/detail/dtos/detail_response_dto.dart';

class CryptoGraphVM {
  final List<CryptoGraphValueVM> prices;

  CryptoGraphVM({this.prices});

  factory CryptoGraphVM.fromDTO(DetailResponseDTO response) {
    return CryptoGraphVM(
      prices: [
        for (final priceTuple in response.prices)
          CryptoGraphValueVM(
            date: DateTime.fromMillisecondsSinceEpoch(priceTuple[0]),
            priceToDate: priceTuple[1],
          )
      ],
    );
  }
}

class CryptoGraphValueVM {
  final DateTime date;
  final double priceToDate;

  CryptoGraphValueVM({this.date, this.priceToDate});
}
