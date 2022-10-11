import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:serviceprovider/model/language_model.dart';

// var aisaIndia = <Map<String, dynamic>>[];
// var asiachina = <Map<String, dynamic>>[];
// var asia = <Map<String, dynamic>>[];
var list1 = <Map<String, dynamic>>[];
// var list1 = <Map<String, dynamic>>[];
// var list1 = <Map<String, dynamic>>[];
// var list1 = <Map<String, dynamic>>[];
// var list1 = <Map<String, dynamic>>[];
// var list1 = <Map<String, dynamic>>[];
// var list1 = <Map<String, dynamic>>[];

class LanguageAPIProvider with ChangeNotifier {
  List<LanguageList> list2 = <LanguageList>[];
  List<LanguageList> aisaChina = <LanguageList>[];
  List<LanguageList> asiaIndonesia = <LanguageList>[];
  List<LanguageList> asiaJapan = <LanguageList>[];
  List<LanguageList> asiasingapore = <LanguageList>[];
  List<LanguageList> asiaThailand = <LanguageList>[];
  List<LanguageList> asiaMynmar = <LanguageList>[];
  List<LanguageList> asiaPalestine = <LanguageList>[];
  List<LanguageList> asiasouthkorea = <LanguageList>[];
  List<LanguageList> asianorthkorea = <LanguageList>[];
  List<LanguageList> asiaKuwait = <LanguageList>[];
  List<LanguageList> asiaafgha = <LanguageList>[];
  List<LanguageList> asiaarmenia = <LanguageList>[];
  List<LanguageList> asiaazer = <LanguageList>[];
  List<LanguageList> asiabahran = <LanguageList>[];
  bool _error = false;
  String _errorMessage = "";
  LanguageModel? _languageModel;

  LanguageModel? get languageModel => _languageModel;

  bool get error => _error;

  String get errorMessage => _errorMessage;

  bool get ifLoading => _error == false && _languageModel == null;

  Future<void> getLanguageList() async {
    final uri = Uri.parse(
        "https://chillkrt.in/service_provider/index.php/Api/language_list");
    final response = await get(uri);

    print("---------------------------");
    print("Fetching _languageModel uri");
    print("---------------------------");

    if (response.statusCode == 200) {
      try {
        final jsonResponse = jsonDecode(response.body);
        _languageModel = LanguageModel.fromJson(jsonResponse);
        list2 = languageModel!.languageList!
            .where((element) => element.country_name_id == '1')
            .toList();
        aisaChina = languageModel!.languageList!
            .where((element) => element.country_name_id == '38')
            .toList();
        asiaIndonesia = languageModel!.languageList!
            .where((element) => element.country_name_id == '80')
            .toList();
        asiasingapore = languageModel!.languageList!
            .where((element) => element.country_name_id == '158')
            .toList();
        asiaThailand = languageModel!.languageList!
            .where((element) => element.country_name_id == '175')
            .toList();
        print("Fetching _languageModel uri success");
      } catch (e) {
        _error = false;
        _errorMessage = e.toString();
        _languageModel = null;
        print("Fetching _languageModel uri fail");
      }
    } else {
      _error = false;
      _errorMessage =
          "Error with response code " + response.statusCode.toString();
      _languageModel = null;
      print("Fetching _languageModel uri fail");
    }
    notifyListeners();
  }

  List<LanguageList> newMethod(String index) {
    print('hello');
    return asiaJapan = languageModel!.languageList!
        .where((element) => element.country_name_id == index.toString())
        .toList();
  }

  initialize() {
    _error = false;
    _errorMessage = "";
    _languageModel = null;
  }
}
