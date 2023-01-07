import 'package:bingo_wholesale/const/app_bar_titles.dart';
import 'package:bingo_wholesale/const/app_strings.dart';
import 'package:bingo_wholesale/data_models/models/store_model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
// import 'package:google_api_headers/google_api_headers.dart';
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

  String allCountryData = "";
  List<String> allCityData = [];
  final ImagePicker _picker = ImagePicker();
  XFile? frontBusinessPhoto;
  XFile? signBoardPhoto;
  StoreData storeData = StoreData();
  String? selectedCountry;
  String? selectedCity;
  String title = AppBarTitles.addStore;
  String submitButton = AppString.addStore;
  double lat = 0.0;
  double long = 0.0;
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

  Future<void> addAddress(context) async {
    Prediction? p = await PlacesAutocomplete.show(
      offset: 0,
      radius: 1000,
      strictbounds: false,
      region: "us",
      language: "en",
      context: context,
      mode: Mode.overlay,
      apiKey: AppSecrets.kGoogleApiKey,
      // sessionToken: sessionToken,
      components: [new Component(Component.country, "us")],
      types: ["(cities)"],
      hint: "Search City",
      // startText: city == null || city == "" ? "" : city,
    );
    addressController.text = p!.description!;
    await displayPrediction(p);
  }

  Future displayPrediction(Prediction pos) async {
    if (pos != null) {
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: AppSecrets.kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(pos.placeId!);

      lat = detail.result.geometry!.location.lat;
      long = detail.result.geometry!.location.lng;

      var address = detail.result.formattedAddress;

      print(lat);
      print(long);
      print(address);
    }
  }

  String locationNameValidation = "";
  String selectedCityValidation = "";
  String addressValidation = "";
  String selectedCountryValidation = "";
  String frontPhotoValidation = "";
  String signBoardPhotoValidation = "";
  void checkValidation() {
    if (locationNameController.text.isEmpty) {
      locationNameValidation = AppString.locationNameValidationMessage;
    } else {
      locationNameValidation = "";
    }
    if (selectedCity == null) {
      selectedCityValidation = AppString.selectedCityValidationMessage;
    } else {
      selectedCityValidation = "";
    }
    if (addressController.text.isEmpty) {
      addressValidation = AppString.addressValidationMessage;
    } else {
      addressValidation = "";
    }
    if (selectedCountry == null) {
      selectedCountryValidation = AppString.selectedCountryValidationMessage;
    } else {
      selectedCountryValidation = "";
    }
    if (frontBusinessPhoto == null) {
      frontPhotoValidation = AppString.frontPhotoValidationMessage;
    } else {
      frontPhotoValidation = "";
    }
    if (signBoardPhoto == null) {
      signBoardPhotoValidation = AppString.signBoardPhotoValidationMessage;
    } else {
      signBoardPhotoValidation = "";
    }
    notifyListeners();
  }

  void addStore() {
    var data = {
      "name": locationNameController.text,
      "city": selectedCity,
      "address": addressController.text,
      "lattitude": lat,
      "longitude": long,
      "country": selectedCountry,
      "remark": remarkController.text,
    };
    checkValidation();
    if (locationNameController.text.isEmpty) {
    } else {}
  }
}
