import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:moderan_weather_app/api/fetch_weather.dart';
import 'package:moderan_weather_app/models/weather_data.dart';

class GloalController extends GetxController {
// create various varibles
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _cardIndex = 0.obs;

  // create getters
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;
  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    super.onInit();
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndexOfCard();
    }
  }

  getLocation() async {
    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission locationPermission;

    //return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location is disabled');
    }

    //status of permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permission is denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      //request permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission != LocationPermission.whileInUse &&
          locationPermission != LocationPermission.always) {
        return Future.error('Location permission is denied');
      }
    }

    //getting the current location
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;

      //calling weather api
      return FetchWeatherApi()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  //function to change the card index
  RxInt getIndexOfCard() {
    return _cardIndex;
  }
}
