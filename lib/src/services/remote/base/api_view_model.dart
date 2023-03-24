import 'package:stacked/stacked.dart';
import 'package:starter_app/src/configs/app_setup.locator.dart';
import 'package:starter_app/src/services/remote/api_service.dart';

mixin ApiViewModel on ReactiveViewModel {
  ApiService _apiService = locator<ApiService>();

  ApiService get apiService => _apiService;
}
