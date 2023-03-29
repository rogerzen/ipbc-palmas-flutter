import 'package:ipbc_palmas/app/lyric/domain/entities/services_list_entity.dart';

import '../../../core/domain/repositories/repository.dart';
import '../../../core/domain/use-cases/use_cases.dart';
import '../../domain/entities/service_entity.dart';
import '../adapters/service_adapter.dart';

class HiveServicesUseCases implements IUseCases<Stream<ServicesListEntity>> {
  final IRepository<Stream<List<Map>>> repository;
  HiveServicesUseCases({required this.repository});

  @override
  Future<Stream<ServicesListEntity>> get(String url) async {
    var result = await repository.get(url);
    if(result != null){
      return result.map(_convert);
    }
    return Stream.value(const ServicesListEntity(servicesList: [],createAt: '2000-01-01'));
  }

  ServicesListEntity _convert(List<Map> entity) {
    return ServiceAdapter.servicesListFromMapList(entity);
  }

  @override
  Future<void> add(path, data) async {
    repository.add(path, data);
  }
}