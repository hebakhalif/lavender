  import 'package:hive/hive.dart';
import 'package:lavender/features/sign_up/logic/entities/user_entity.dart';

abstract class SignUpLocalDataSource {
  Future<void> cacheUserData(UserEntity user);
  Future<UserEntity?> getCachedUserData();
  Future<void> clearCachedUserData();
}

class SignUpLocalDataSourceImpl implements SignUpLocalDataSource {
  final Box box;
  final String userId;

  SignUpLocalDataSourceImpl(this.box, this.userId);

  @override
  Future<void> cacheUserData(UserEntity user) async {
    await box.put('user', user);
    await box.put('userId', userId);
  }
  @override
  Future<UserEntity?> getCachedUserData() async {
    return box.get('user');
  }

  @override
  Future<void> clearCachedUserData() async {
    await box.delete('user');
    await box.delete('userId');
  }

}