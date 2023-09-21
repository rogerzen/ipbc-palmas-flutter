
import 'package:auth_module/src/domain/entities/auth_entity.dart';
import 'package:core_module/core_module.dart';

class AuthUseCase implements IUseCases<AuthEntity>{
  final IRepository<dynamic> repository;
  AuthUseCase({required this.repository});

  @override
  Future<AuthEntity> get(String url) async {
    var result = await repository.get(url);
    return HiveAuthAdapter.fromMap(result);
  }

  @override
  Future<void> add(path, data) async {
    repository.add(path, data);
  }

  @override
  Future<void> update(path, data) async {
    repository.update(path, data);
  }
}