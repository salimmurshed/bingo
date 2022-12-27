import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/const/app_strings.dart';
import 'package:bingo_wholesale/data_models/models/store_model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app_secrets.dart';
import '../../../app/locator.dart';
import '../../../repository/repository_components.dart';
import '../../../services/navigation/navigationService.dart';

class AddStoreViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final RepositoryComponents _repositoryComponents =
      locator<RepositoryComponents>();
  AddStoreViewModel() {
    getCity();
    getCountry();
  }
  TextEditingController locationNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  Prediction? p;

  String allCountryData = "";
  List<String> allCityData = [];
  final ImagePicker _picker = ImagePicker();
  XFile? frontBusinessPhoto;
  XFile? signBoardPhoto;
  StoreData storeData = StoreData();
  String selectedCountry = AppString.selectCountry;
  String selectedCity = AppString.selectCity;
  String title = AppBarTitles.addStore;
  String submitButton = AppString.addStore;
  void pickFrontBusinessPhoto() async {
    frontBusinessPhoto = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  void pickSignBoardPhoto() async {
    signBoardPhoto = await _picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  void removeRequest() async {
    _navigationService.pop();
  }

  void getCity() async {
    setBusy(true);
    notifyListeners();
    await _repositoryComponents.getCity();
    allCityData = (_repositoryComponents.allCityData.value)
        .data!
        .map((e) => e.city!)
        .toList();
    setBusy(false);
    notifyListeners();
  }

  void getCountry() async {
    setBusy(true);
    notifyListeners();
    await _repositoryComponents.getCountry();
    allCountryData =
        (_repositoryComponents.allCountryData.value).data!.country!;
    setBusy(false);
    notifyListeners();
  }

  void changeCountry(String data) {
    selectedCountry = data;
    notifyListeners();
  }

  void changeCity(String data) {
    selectedCity = data;
    notifyListeners();
  }

  void setDetails(StoreData arguments) {
    storeData = arguments;
    preFix(arguments);
    notifyListeners();
  }

  void preFix(StoreData data) {
    locationNameController.text = data.name!;
    addressController.text = data.address!;
    remarkController.text = data.remarks!;
    title = AppBarTitles.editStore;
    submitButton = AppString.editStore;
    notifyListeners();
  }

  Future<void> addStore(context) async {
    p = await PlacesAutocomplete.show(
        context: context,
        apiKey: AppSecrets.kGoogleApiKey,
        mode: Mode.overlay, // Mode.fullscreen
        language: "fr",
        components: [Component(Component.country, "fr")]);
    addressController.text = p!.description!;
  }
}
