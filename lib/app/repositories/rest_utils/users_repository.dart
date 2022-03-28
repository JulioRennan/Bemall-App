import 'package:bemall_app/app/entities/user_entity.dart';
import 'package:bemall_app/app/providers/rest_utils.dart';

class UsersRepository extends RestUtils {
  Future<List<UserEntity>> getListUsersOnServer() {
    return get('/user', withToken: true).then((response) {
      return (response.data as List)
          .map((userResponse) => UserEntity.fromMap(userResponse))
          .toList();
    });
  }
}
