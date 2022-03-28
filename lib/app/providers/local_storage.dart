import 'package:get_storage/get_storage.dart';

enum BoxName {
  USER,
  SETTINGS,
}

class LocalStorage {
  late final GetStorage _box;

  static Future<dynamic> initStorage() {
    List<Future> containerToBeInitialized = [];
    BoxName.values.forEach((boxName) {
      containerToBeInitialized.add(
        GetStorage.init(boxName.name),
      );
    });
    return Future.wait(containerToBeInitialized);
  }

  LocalStorage(BoxName boxName) {
    this._box = GetStorage(boxName.name);
  }

  Future<void> updateData(Enum key, dynamic value) {
    return this._box.write(key.name, value).then((value) {
      print("salvooou");
    });
  }

  T? getData<T>(Enum key) {
    return this._box.read(key.name);
  }

  Future<void> deleteBox(BoxName boxName) {
    return this._box.erase();
  }
}
