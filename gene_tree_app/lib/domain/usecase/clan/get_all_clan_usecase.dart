import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';

class GetAllClanUsecase {
  final ClanRepository repo;

  GetAllClanUsecase(this.repo);

  Future<List<ClanEntity>> call(String userId) async {
    final result = await repo.getAllClanById(userId);
    return result.data ?? [];
  }
}
