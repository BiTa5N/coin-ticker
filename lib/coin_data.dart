import 'dart:convert';
import 'package:http/http.dart' as http;


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
];


const String coinGeckoURL =
    'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    String requestURL = '${coinGeckoURL}${selectedCurrency}';
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['bitcoin']['${selectedCurrency.toLowerCase()}'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
