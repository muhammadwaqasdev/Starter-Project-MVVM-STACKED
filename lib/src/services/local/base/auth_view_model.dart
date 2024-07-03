import 'package:stacked/stacked.dart';
import 'package:starter/src/configs/app_setup.locator.dart';
import 'package:starter/src/services/local/auth_service.dart';

mixin AuthViewModel on ReactiveViewModel {
  AuthService _authService = locator<AuthService>();

  AuthService get authService => _authService;
}