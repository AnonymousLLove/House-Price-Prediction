import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DropDownMenuExample extends StatefulWidget {
  const DropDownMenuExample({super.key});

  @override
  _DropDownMenuExampleState createState() => _DropDownMenuExampleState();
}

const Map<String, int> categoryMap = {
  'Hotel': 0,
  'Land': 1,
  'Office': 2,
  'Other': 3,
  'Residence': 4,
  'Shop': 5,
  'Warehouse': 6
};

const Map<String, int> furnishedMap = {
  'No': 0,
  'Yes': 1,
};

const Map<String, int> newMap = {
  'No': 0,
  'Yes': 1,
};

const Map<String, int> stateMap = {
  'Abia': 0,
  'Abuja': 1,
  'Adamawa': 2,
  'Anambra': 3,
  'Bauchi': 4,
  'Benue': 5,
  'Borno': 6,
  'Delta': 7,
  'Ebonyi': 8,
  'Edo': 9,
  'Ekiti': 10,
  'Enugu': 11,
  'Ibom': 12,
  'Imo': 13,
  'Jigawa': 14,
  'Kaduna': 15,
  'Kogi': 16,
  'Kwara': 17,
  'Lagos': 18,
  'Nassarawa': 19,
  'Niger': 20,
  'Ogun': 21,
  'Ondo': 22,
  'Osun': 23,
  'Oyo': 24,
  'Plateau': 25,
  'River': 26,
  'Rivers': 27,
  'Sokoto': 28,
  'Zamfara': 29,
};

const Map<String, int> townMap = {
  'Aba Abeokuta': 0,
  'Abijo Ajah': 1,
  'Aboru Alimosho': 2,
  'Aboru Ipaja': 3,
  'Abuja Lugbe': 4,
  'Abuja Maitama': 5,
  'Abule Egba': 6,
  'Adekunle Yaba': 7,
  'Adelabu Surulere': 8,
  'Adigbe Abeokuta': 9,
  'Ado Ajah': 10,
  'Ado Ibadan': 11,
  'Afa Isolo': 12,
  'Agege': 13,
  'Agege Agege': 14,
  'Agidingbi Ikeja': 15,
  'Agodi Ibadan': 16,
  'Agoro Yaba': 17,
  'Agric Ikorodu': 18,
  'Aguda Surulere': 19,
  'Agudaogba Ogba': 20,
  'Agungi Lekki': 21,
  'Ajah': 22,
  'Ajah Ajah': 23,
  'Ajibode Ibadan': 24,
  'Ajiwe Ajah': 25,
  'Akari Isolo': 26,
  'Akesan Alimosho': 27,
  'Akobo Ibadan': 28,
  'Akoka Yaba': 29,
  'Akowonjo Alimosho': 30,
  'Akran Ikeja': 31,
  'Alagbole Ojodu': 32,
  'Alagomeji Yaba': 33,
  'Alakia Ibadan': 34,
  'Alalubosa Ibadan': 35,
  'Alapere Ketu': 36,
  'Alausa Ikeja': 37,
  'Alimosho': 38,
  'Amuwo Odofin': 39,
  'Apapa': 40,
  'Apata Ibadan': 41,
  'Apo': 42,
  'Araba Surulere': 43,
  'Area Ibadan': 44,
  'Area Lekki': 45,
  'Arepo': 46,
  'Arepo Arepo': 47,
  'Asaba': 48,
  'Asero Abeokuta': 49,
  'Asokoro': 50,
  'Asokoro Asokoro': 51,
  'Avenue Gwarinpa': 52,
  'Avenue Ikeja': 53,
  'Avenue Surulere': 54,
  'Awka North': 55,
  'Awka South': 56,
  'Awoyaya Ajah': 57,
  'Axis Lugbe': 58,
  'Ayobo Alimosho': 59,
  'Ayobo Ipaja': 60,
  'Badore Ajah': 61,
  'Bariga': 62,
  'Bariga Shomolu': 63,
  'Baruwa Ipaja': 64,
  'Basorun Ibadan': 65,
  'Berger Ojodu': 66,
  'Bodija Ibadan': 67,
  'Bogije Sangotedo': 68,
  'Bourdillon Ikoyi': 69,
  'Bucknor Isolo': 70,
  'Cement Agege': 71,
  'Central Area': 72,
  'Challenge Ibadan': 73,
  'Chevron Lekki': 74,
  'Command Ipaja': 75,
  'Corner Enugu': 76,
  'Dawaki Gwarinpa': 77,
  'District Maitama': 78,
  'Dopemu Agege': 79,
  'Drive Lekki': 80,
  'Durumi': 81,
  'Ebute Ikorodu': 82,
  'Efon Lekki': 83,
  'Egbe Idimu': 84,
  'Egbeda Alimosho': 85,
  'Ejigbo Ejigbo': 86,
  'Ekulu Enugu': 87,
  'Eleyele Ibadan': 88,
  'Engineering Gwarinpa': 89,
  'Enugu Enugu': 90,
  'Epe': 91,
  'Express Ibadan': 92,
  'Expressway Ajah': 93,
  'Expressway Oshodi': 94,
  'Extension Enugu': 95,
  'Extension Ibadan': 96,
  'Fadeyi Shomolu': 97,
  'Fagba Agege': 98,
  'Falomo Ikoyi': 99,
  'Gaduwa': 100,
  'Galadinmawa': 101,
  'Garage Gbagada': 102,
  'Garki': 103,
  'Gate Lekki': 104,
  'Gbagada': 105,
  'Gbagada Gbagada': 106,
  'Gilmore Jahi': 107,
  'Gra Apapa': 108,
  'Gra Ibadan': 109,
  'Gra Ikeja': 110,
  'Gra Lekki': 111,
  'Gra Ogba': 112,
  'Gra Ogudu': 113,
  'Gra Oredo': 114,
  'Guzape': 115,
  'Guzape Guzape': 116,
  'Gwarimpa Gwarinpa': 117,
  'Gwarinpa': 118,
  'Gwarinpa Gwarinpa': 119,
  'Iba Ojo': 120,
  'Ibadan': 121,
  'Ibadan Ibadan': 122,
  'Ibeju Lekki': 123,
  'Ibeshe Ikorodu': 124,
  'Idado Lekki': 125,
  'Idishin Ibadan': 126,
  'Ifako Agege': 127,
  'Igando Alimosho': 128,
  'Igbogbo Ikorodu': 129,
  'Ijede Ikorodu': 130,
  'Ijesha Surulere': 131,
  'Ijesha Yaba': 132,
  'Iju': 133,
  'Ikate Lekki': 134,
  'Ikeja': 135,
  'Ikeja Ikeja': 136,
  'Ikorodu': 137,
  'Ikorodu Ikorodu': 138,
  'Ikota Lekki': 139,
  'Ikotun Alimosho': 140,
  'Ikotun Igando': 141,
  'Ikoyi': 142,
  'Ikoyi Ikoyi': 143,
  'Ilaje Ajah': 144,
  'Ilasamaja Mushin': 145,
  'Ilasan Lekki': 146,
  'Ilupeju': 147,
  'Ilupeju Ilupeju': 148,
  'Ipaja': 149,
  'Ipaja Alimosho': 150,
  'Ipaja Ipaja': 151,
  'Iponri Surulere': 152,
  'Ira Ogba': 153,
  'Ishaga Agege': 154,
  'Island Ikoyi': 155,
  'Isolo': 156,
  'Itire Surulere': 157,
  'Iwaya Yaba': 158,
  'Iyanganku Ibadan': 159,
  'Jabi': 160,
  'Jabi Jabi': 161,
  'Jahi': 162,
  'Jahi Jahi': 163,
  'Jakande Lekki': 164,
  'Jericho Ibadan': 165,
  'Jibowu Yaba': 166,
  'Jones Ikeja': 167,
  'Kado': 168,
  'Katampe Ext': 169,
  'Katampe Main': 170,
  'Ketu': 171,
  'Ketu Ketu': 172,
  'Kosofe Ikosi': 173,
  'Kubwa': 174,
  'Kubwa Kubwa': 175,
  'Lafiaji Lekki': 176,
  'Lagos Alimosho': 177,
  'Lagos Island': 178,
  'Lagos Yaba': 179,
  'Lakowe Ajah': 180,
  'Lawanson Surulere': 181,
  'Layout Enugu': 182,
  'Lbs Ajah': 183,
  'Lekki': 184,
  'Lekki Lekki': 185,
  'Life Camp': 186,
  'Lokogoma': 187,
  'London Lekki': 188,
  'Lugbe': 189,
  'Lugbe Lugbe': 190,
  'Mabushi': 191,
  'Mabushi Mabushi': 192,
  'Macpherson Ikoyi': 193,
  'Mafoluku Oshodi': 194,
  'Maitama': 195,
  'Maitama Maitama': 196,
  'Majek Sangotedo': 197,
  'Mangoro Ikeja': 198,
  'Market Lugbe': 199,
  'Marsha Surulere': 200,
  'Maryland': 201,
  'Maryland Ikeja': 202,
  'Masha Surulere': 203,
  'Medina Gbagada': 204,
  'Mende Maryland': 205,
  'Metta Yaba': 206,
  'Moniya Ibadan': 207,
  'Moore Surulere': 208,
  'Mosan Abeokuta': 209,
  'Mushin': 210,
  'Mushin Mushin': 211,
  'North Ojodu': 212,
  'Oba Agege': 213,
  'Obafemi Owode': 214,
  'Obanikoro Shomolu': 215,
  'Obawole Ogba': 216,
  'Obio Akpor': 217,
  'Odo Ota': 218,
  'Ogba': 219,
  'Ogba Ogba': 220,
  'Ogombo Ajah': 221,
  'Ogudu': 222,
  'Ogudu Ogudu': 223,
  'Ogunlana Surulere': 224,
  'Ogunsanya Surulere': 225,
  'Oja Yaba': 226,
  'Ojodu': 227,
  'Ojodu Ojodu': 228,
  'Ojoo Ibadan': 229,
  'Ojota': 230,
  'Ojota Ojota': 231,
  'Ojuelegba Surulere': 232,
  'Okota': 233,
  'Ologolo Lekki': 234,
  'Ologuneru Ibadan': 235,
  'Olokonla Ajah': 236,
  'Olowora Ojodu': 237,
  'Ona Ibadan': 238,
  'Onike Yaba': 239,
  'Onipanu Shomolu': 240,
  'Opebi Ikeja': 241,
  'Orchid Lekki': 242,
  'Oredo': 243,
  'Oregun Ikeja': 244,
  'Orike Ogudu': 245,
  'Osapa Lekki': 246,
  'Oshodi': 247,
  'Other': 248,
  'Oworonshoki Gbagada': 249,
  'Palace Okota': 250,
  'Palmgroove Shomolu': 251,
  'Pedro Gbagada': 252,
  'Pedro Shomolu': 253,
  'Pipeline Alimosho': 254,
  'Port Harcourt': 255,
  'Quarters Apo': 256,
  'Rd Ibadan': 257,
  'Right Lekki': 258,
  'Roadikeja Ikeja': 259,
  'Roadilupeju Ilupeju': 260,
  'Sabo Yaba': 261,
  'Sagamu Sagamu': 262,
  'Salem Lekki': 263,
  'Samonda Ibadan': 264,
  'Sangotedo': 265,
  'Sangotedo Ajah': 266,
  'School Durumi': 267,
  'Shasha Alimosho': 268,
  'Shomolu': 269,
  'Shomolu Shomolu': 270,
  'Soka Ibadan': 271,
  'Soluyi Gbagada': 272,
  'Surulere': 273,
  'Sw Ikoyi': 274,
  'Tejuosho Yaba': 275,
  'Thomas Surulere': 276,
  'Tollgate Lekki': 277,
  'Town Ipaja': 278,
  'Town Lekki': 279,
  'Ups Gbagada': 280,
  'Utako': 281,
  'Utako Utako': 282,
  'Uyo Akwa': 283,
  'Vgc Lekki': 284,
  'Victoria Island': 285,
  'Way Ikeja': 286,
  'Way Isolo': 287,
  'Way Lekki': 288,
  'West Ibadan': 289,
  'Wuse': 290,
  'Wuye': 291,
  'Wuye Wuye': 292,
  'Yaba': 293,
  'games': 294
};

class _DropDownMenuExampleState extends State<DropDownMenuExample> {
  String? _selectedValue1;
  String? _selectedValue4;
  String? _selectedValue5;
  String? _selectedValue6;
  String? _selectedValue7;
  String? _selectedValue8;
  String? _predictedPrice;

  Future<void> predictPrice() async {
    // Map the dropdown values to integers using the defined maps
    final category = categoryMap[_selectedValue1] ?? 0;
    final town = townMap[selectedValue2] ?? 0;
    final state = stateMap[selectedValue] ?? 0;
    final bedroom = int.parse(_selectedValue4 ?? '0');
    final bathroom = int.parse(_selectedValue5 ?? '0');
    final toilet = int.parse(_selectedValue6 ?? '0');
    final furnished = furnishedMap[_selectedValue7] ?? 0;
    final newlyBuilt = newMap[_selectedValue8] ?? 0;

    // Creating the JSON body for the API request
    final body = jsonEncode({
      "Newly Built": newlyBuilt,
      "Furnished": furnished,
      "Bedrooms": bedroom,
      "Bathrooms": bathroom,
      "Toilets": toilet,
      "state": state,
      "town": town,
      "Category": category,
    });

    // this is to Make the POST request to the Flask API
    final response = await http.post(
      Uri.parse('http://127.0.0.1:5000/predict'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    // This Handle the response
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        _predictedPrice = jsonResponse['price'].toString();
      });
    } else {}
  }

  List<String> numberOptions =
      List.generate(100, (index) => (index + 1).toString());

  Widget buildDropDown({
    required String labelText,
    required String? selectedValue,
    required List<String> options,
    required Function(String?) onChanged,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 110,
          child: Text(labelText,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.blue,
                  Color(0xff081b25),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              height: 50,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: const Color(0xff081b25),
                  value: selectedValue,
                  hint: Text("Select $labelText",
                      style: const TextStyle(color: Colors.white)),
                  isExpanded: true,
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  final List<String> items = [
    'Abia',
    'Abuja',
    'Adamawa',
    'Anambra',
    'Bauchi',
    'Benue',
    'Borno',
    'Delta',
    'Ebonyi',
    'Edo',
    'Ekiti',
    'Enugu',
    'Ibom',
    'Imo',
    'Jigawa',
    'Kaduna',
    'Kogi',
    'Kwara',
    'Lagos',
    'Nassarawa',
    'Niger',
    'Ogun',
    'Ondo',
    'Osun',
    'Oyo',
    'Plateau',
    'River',
    'Rivers',
    'Sokoto',
    'Zamfara'
  ];

  final List<String> items2 = [
    'Aba Abeokuta',
    'Abijo Ajah',
    'Aboru Alimosho',
    'Aboru Ipaja',
    'Abuja Lugbe',
    'Abuja Maitama',
    'Abule Egba',
    'Adekunle Yaba',
    'Adelabu Surulere',
    'Adigbe Abeokuta',
    'Ado Ajah',
    'Ado Ibadan',
    'Afa Isolo',
    'Agege',
    'Agege Agege',
    'Agidingbi Ikeja',
    'Agodi Ibadan',
    'Agoro Yaba',
    'Agric Ikorodu',
    'Aguda Surulere',
    'Agudaogba Ogba',
    'Agungi Lekki',
    'Ajah',
    'Ajah Ajah',
    'Ajibode Ibadan',
    'Ajiwe Ajah',
    'Akari Isolo',
    'Akesan Alimosho',
    'Akobo Ibadan',
    'Akoka Yaba',
    'Akowonjo Alimosho',
    'Akran Ikeja',
    'Alagbole Ojodu',
    'Alagomeji Yaba',
    'Alakia Ibadan',
    'Alalubosa Ibadan',
    'Alapere Ketu',
    'Alausa Ikeja',
    'Alimosho',
    'Amuwo Odofin',
    'Apapa',
    'Apata Ibadan',
    'Apo',
    'Araba Surulere',
    'Area Ibadan',
    'Area Lekki',
    'Arepo',
    'Arepo Arepo',
    'Asaba',
    'Asero Abeokuta',
    'Asokoro',
    'Asokoro Asokoro',
    'Avenue Gwarinpa',
    'Avenue Ikeja',
    'Avenue Surulere',
    'Awka North',
    'Awka South',
    'Awoyaya Ajah',
    'Axis Lugbe',
    'Ayobo Alimosho',
    'Ayobo Ipaja',
    'Badore Ajah',
    'Bariga',
    'Bariga Shomolu',
    'Baruwa Ipaja',
    'Basorun Ibadan',
    'Berger Ojodu',
    'Bodija Ibadan',
    'Bogije Sangotedo',
    'Bourdillon Ikoyi',
    'Bucknor Isolo',
    'Cement Agege',
    'Central Area',
    'Challenge Ibadan',
    'Chevron Lekki',
    'Command Ipaja',
    'Corner Enugu',
    'Dawaki Gwarinpa',
    'District Maitama',
    'Dopemu Agege',
    'Drive Lekki',
    'Durumi',
    'Ebute Ikorodu',
    'Efon Lekki',
    'Egbe Idimu',
    'Egbeda Alimosho',
    'Ejigbo Ejigbo',
    'Ekulu Enugu',
    'Eleyele Ibadan',
    'Engineering Gwarinpa',
    'Enugu Enugu',
    'Epe',
    'Express Ibadan',
    'Expressway Ajah',
    'Expressway Oshodi',
    'Extension Enugu',
    'Extension Ibadan',
    'Fadeyi Shomolu',
    'Fagba Agege',
    'Falomo Ikoyi',
    'Gaduwa',
    'Galadinmawa',
    'Garage Gbagada',
    'Garki',
    'Gate Lekki',
    'Gbagada',
    'Gbagada Gbagada',
    'Gilmore Jahi',
    'Gra Apapa',
    'Gra Ibadan',
    'Gra Ikeja',
    'Gra Lekki',
    'Gra Ogba',
    'Gra Ogudu',
    'Gra Oredo',
    'Guzape',
    'Guzape Guzape',
    'Gwarimpa Gwarinpa',
    'Gwarinpa',
    'Gwarinpa Gwarinpa',
    'Iba Ojo',
    'Ibadan',
    'Ibadan Ibadan',
    'Ibeju Lekki',
    'Ibeshe Ikorodu',
    'Idado Lekki',
    'Idishin Ibadan',
    'Ifako Agege',
    'Igando Alimosho',
    'Igbogbo Ikorodu',
    'Ijede Ikorodu',
    'Ijesha Surulere',
    'Ijesha Yaba',
    'Iju',
    'Ikate Lekki',
    'Ikeja',
    'Ikeja Ikeja',
    'Ikorodu',
    'Ikorodu Ikorodu',
    'Ikota Lekki',
    'Ikotun Alimosho',
    'Ikotun Igando',
    'Ikoyi',
    'Ikoyi Ikoyi',
    'Ilaje Ajah',
    'Ilasamaja Mushin',
    'Ilasan Lekki',
    'Ilupeju',
    'Ilupeju Ilupeju',
    'Ipaja',
    'Ipaja Alimosho',
    'Ipaja Ipaja',
    'Iponri Surulere',
    'Ira Ogba',
    'Ishaga Agege',
    'Island Ikoyi',
    'Isolo',
    'Itire Surulere',
    'Iwaya Yaba',
    'Iyanganku Ibadan',
    'Jabi',
    'Jabi Jabi',
    'Jahi',
    'Jahi Jahi',
    'Jakande Lekki',
    'Jericho Ibadan',
    'Jibowu Yaba',
    'Jones Ikeja',
    'Kado',
    'Katampe Ext',
    'Katampe Main',
    'Ketu',
    'Ketu Ketu',
    'Kosofe Ikosi',
    'Kubwa',
    'Kubwa Kubwa',
    'Lafiaji Lekki',
    'Lagos Alimosho',
    'Lagos Island',
    'Lagos Yaba',
    'Lakowe Ajah',
    'Lawanson Surulere',
    'Layout Enugu',
    'Lbs Ajah',
    'Lekki',
    'Lekki Lekki',
    'Life Camp',
    'Lokogoma',
    'London Lekki',
    'Lugbe',
    'Lugbe Lugbe',
    'Mabushi',
    'Mabushi Mabushi',
    'Macpherson Ikoyi',
    'Mafoluku Oshodi',
    'Maitama',
    'Maitama Maitama',
    'Majek Sangotedo',
    'Mangoro Ikeja',
    'Market Lugbe',
    'Marsha Surulere',
    'Maryland',
    'Maryland Ikeja',
    'Masha Surulere',
    'Medina Gbagada',
    'Mende Maryland',
    'Metta Yaba',
    'Moniya Ibadan',
    'Moore Surulere',
    'Mosan Abeokuta',
    'Mushin',
    'Mushin Mushin',
    'North Ojodu',
    'Oba Agege',
    'Obafemi Owode',
    'Obanikoro Shomolu',
    'Obawole Ogba',
    'Obio Akpor',
    'Odo Ota',
    'Ogba',
    'Ogba Ogba',
    'Ogombo Ajah',
    'Ogudu',
    'Ogudu Ogudu',
    'Ogunlana Surulere',
    'Ogunsanya Surulere',
    'Oja Yaba',
    'Ojodu',
    'Ojodu Ojodu',
    'Ojoo Ibadan',
    'Ojota',
    'Ojota Ojota',
    'Ojuelegba Surulere',
    'Okota',
    'Ologolo Lekki',
    'Ologuneru Ibadan',
    'Olokonla Ajah',
    'Olowora Ojodu',
    'Ona Ibadan',
    'Onike Yaba',
    'Onipanu Shomolu',
    'Opebi Ikeja',
    'Orchid Lekki',
    'Oredo',
    'Oregun Ikeja',
    'Orike Ogudu',
    'Osapa Lekki',
    'Oshodi',
    'Other',
    'Oworonshoki Gbagada',
    'Palace Okota',
    'Palmgroove Shomolu',
    'Pedro Gbagada',
    'Pedro Shomolu',
    'Pipeline Alimosho',
    'Port Harcourt',
    'Quarters Apo',
    'Rd Ibadan',
    'Right Lekki',
    'Roadikeja Ikeja',
    'Roadilupeju Ilupeju',
    'Sabo Yaba',
    'Sagamu Sagamu',
    'Salem Lekki',
    'Samonda Ibadan',
    'Sangotedo',
    'Sangotedo Ajah',
    'School Durumi',
    'Shasha Alimosho',
    'Shomolu',
    'Shomolu Shomolu',
    'Soka Ibadan',
    'Soluyi Gbagada',
    'Surulere',
    'Sw Ikoyi',
    'Tejuosho Yaba',
    'Thomas Surulere',
    'Tollgate Lekki',
    'Town Ipaja',
    'Town Lekki',
    'Ups Gbagada',
    'Utako',
    'Utako Utako',
    'Uyo Akwa',
    'Vgc Lekki',
    'Victoria Island',
    'Way Ikeja',
    'Way Isolo',
    'Way Lekki',
    'West Ibadan',
    'Wuse',
    'Wuye',
    'Wuye Wuye',
    'Yaba',
    'games'
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  String? selectedValue2;
  final TextEditingController textEditingController2 = TextEditingController();

  void dispose2() {
    textEditingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDropDown(
          labelText: "Category: ",
          selectedValue: _selectedValue1,
          options: [
            'Hotel',
            'Land',
            'Office',
            'Residence',
            'Shop',
            'Warehouse',
            'Other'
          ],
          onChanged: (newValue) {
            setState(() {
              _selectedValue1 = newValue;
            });
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 110,
              child: Text('Town:',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.blue,
                      Color(0xff081b25),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                padding: const EdgeInsets.only(right: 0.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    hint: const Text(
                      'Select Town:',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    items: items2
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ))
                        .toList(),
                    value: selectedValue2,
                    onChanged: (value) {
                      setState(() {
                        selectedValue2 = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      height: 40,
                      width: 200,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        color: Color(0xff081a25),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController2,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        color: const Color(0xff081b25),
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: textEditingController2,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for a Town.',
                            hintStyle: const TextStyle(
                                color: Colors.white, fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item2, searchValue) {
                        // Convert both item and searchValue to lowercase for case-insensitive comparison
                        final lowerItem2 = item2.value.toString().toLowerCase();
                        final lowerSearchValue = searchValue.toLowerCase();
                        return lowerItem2.contains(lowerSearchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController2.clear();
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 110,
              child: Text('State:',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.blue,
                      Color(0xff081b25),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                padding: const EdgeInsets.only(right: 0.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    hint: const Text(
                      'Select State:',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 11),
                      height: 40,
                      width: 200,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        color: Color(0xff081a25),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        color: const Color(0xff081b25),
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: textEditingController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for a State..',
                            hintStyle: const TextStyle(
                                color: Colors.white, fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        // Convert both item and searchValue to lowercase for case-insensitive comparison
                        final lowerItem = item.value.toString().toLowerCase();
                        final lowerSearchValue = searchValue.toLowerCase();
                        return lowerItem.contains(lowerSearchValue);
                      },
                    ),
                    //This to clear the search value when a user close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        buildDropDown(
          labelText: "Bedroom: ",
          selectedValue: _selectedValue4,
          options: numberOptions,
          onChanged: (newValue) {
            setState(() {
              _selectedValue4 = newValue;
            });
          },
        ),
        const SizedBox(height: 10),
        buildDropDown(
          labelText: "Bathroom: ",
          selectedValue: _selectedValue5,
          options: numberOptions,
          onChanged: (newValue) {
            setState(() {
              _selectedValue5 = newValue;
            });
          },
        ),
        const SizedBox(height: 10),
        buildDropDown(
          labelText: "Toilet ",
          selectedValue: _selectedValue6,
          options: numberOptions,
          onChanged: (newValue) {
            setState(() {
              _selectedValue6 = newValue;
            });
          },
        ),
        const SizedBox(height: 10),
        buildDropDown(
          labelText: "Furnished",
          selectedValue: _selectedValue7,
          options: [
            'Yes',
            'No',
          ],
          onChanged: (newValue) {
            setState(() {
              _selectedValue7 = newValue;
            });
          },
        ),
        const SizedBox(height: 10),
        buildDropDown(
          labelText: "Newly Built: ",
          selectedValue: _selectedValue8,
          options: [
            'Yes',
            'No',
          ],
          onChanged: (newValue) {
            setState(() {
              _selectedValue8 = newValue;
            });
          },
        ),
        const SizedBox(height: 10),
        Center(
          child: InkWell(
            onTap: () {
              predictPrice(); // Call the function when the button is pressed
            },
            child: Container(
                height: 70,
                width: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 11, 66, 111),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Price:',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      const SizedBox(width: 10),
                      Text(
                          _predictedPrice != null
                              ? '$_predictedPrice naira'
                                 : '0 naira',
                              
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ])),
          ),
        )
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> options;

  CustomSearchDelegate({required this.options});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> results = options
        .where((option) => option.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results.map<Widget>((result) {
        return ListTile(
          title: Text(result),
          onTap: () {
            query = result;
            showResults(context);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = options
        .where((option) => option.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions.map<Widget>((suggestion) {
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      }).toList(),
    );
  }
}
