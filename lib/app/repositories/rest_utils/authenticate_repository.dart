import 'package:bemall_app/app/entities/user_entity.dart';
import 'package:bemall_app/app/entities/user_token_entity.dart';
import 'package:bemall_app/app/providers/rest_utils.dart';

class AuthenticateRepository extends RestUtils {
  Future<UserEntity> signUp(UserEntity userEntity, String password) async {
    final address = userEntity.address[0];
    final response = await post(
      '/user',
      {
        "name": userEntity.name,
        "email": userEntity.email,
        "password": password,
        "cep": address.cep,
        "numero": address.numero,
        "bairro": address.bairro,
        "logradouro": address.logradouro,
        "cidade": address.cidade,
        "uf": address.uf
      },
    );
    return UserEntity.fromMap(response.data);
  }

  Future<UserTokenEntity> signIn(String email, String password) async {
    final response = await post('/session', {
      'email': email,
      'password': password,
    });

    return UserTokenEntity.fromMap(response.data);
  }
}
