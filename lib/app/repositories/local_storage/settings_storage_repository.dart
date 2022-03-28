import '../../providers/local_storage.dart';

enum Fields {
  ONBOADING,
  TOKEN,
}

class SettingsStorageRepository extends LocalStorage {
  SettingsStorageRepository() : super(BoxName.SETTINGS);

  String? get token {
    return getData(Fields.TOKEN);
  }

  bool get isNeedShowOnboarding {
    return getData(Fields.ONBOADING) ?? true;
  }

  bool get isLogged {
    return token != null;
  }

  Future<void> setValue(Fields key, dynamic value) {
    return updateData(key, value);
  }
}
