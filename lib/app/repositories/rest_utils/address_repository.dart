import 'package:bemall_app/app/entities/address_entity.dart';
import 'package:bemall_app/app/providers/rest_utils.dart';

class AddressRepository extends RestUtils {
  Future<AddressEntity> queryAddress(String cep) async {
    return get(
      '/address/$cep',
    ).then(
      (response) => AddressEntity.fromMap(response.data['address']),
    );
  }
}
