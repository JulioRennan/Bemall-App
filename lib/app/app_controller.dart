import 'package:bemall_app/app/entities/user_token_entity.dart';
import 'package:get/get.dart';
import 'repositories/local_storage/settings_storage_repository.dart';
import 'routes/pages.dart';

class AppController {
  static final to = Get.find<AppController>();
  final SettingsStorageRepository _settingsStorage;

  AppController({
    SettingsStorageRepository? storage,
  }) : _settingsStorage = storage ?? SettingsStorageRepository();

  Future<void> saveToken(UserTokenEntity userTokenEntity) async {
    return _settingsStorage.setValue(Fields.TOKEN, userTokenEntity.token);
  }

  String get token {
    return _settingsStorage.token ?? "";
  }

  String get getInitialRoute {
    if (isSignIn)
      return AppRoutes.SIGN_IN;
    else
      return AppRoutes.HOME;
  }

  bool get isSignIn {
    return !_settingsStorage.isLogged;
  }

  signOut() async {
    await _settingsStorage.setValue(Fields.TOKEN, null);
    Get.offAllNamed(AppRoutes.SIGN_IN);
  }

  Future<void> saveDontNeedShowOnboarding() {
    return _settingsStorage.setValue(Fields.ONBOADING, false);
  }
}
