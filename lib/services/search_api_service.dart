import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:fine_dust_tracker/models/measurement_station_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<MeasurementStation>> searchAPIService(String userInput) async {
  final List<MeasurementStation> stationList = [];

  const searchByAddressURL =
      "https://apis.data.go.kr/B552584/MsrstnInfoInqireSvc/getMsrstnList";

  final searchURL = Uri.parse(searchByAddressURL).replace(
    queryParameters: {
      'serviceKey': dotenv.env['API_KEY'],
      'returnType': 'xml',
      'addr': userInput,
    },
  );

  final response = await http.get(searchURL);

  final responseData = xml.XmlDocument.parse(response.body);
  final itemElements = responseData.findAllElements('item');

  for (var item in itemElements) {
    final stationName = item.getElement('stationName')?.innerText ?? '';
    final addr = item.getElement('addr')?.innerText ?? '';
    final dmX = double.tryParse(item.getElement('dmX')?.innerText ?? '');
    final dmY = double.tryParse(item.getElement('dmY')?.innerText ?? '');

    if (stationName.isNotEmpty &&
        addr.isNotEmpty &&
        dmX != null &&
        dmY != null) {
      final measurementStation = MeasurementStation(
        currentAddr: addr,
        stationName: stationName,
        pm10Value: 0,
        pm25Value: 0,
        dataTime: DateTime.now(),
      );
      stationList.add(measurementStation);
    }
  }

  return stationList;
}
