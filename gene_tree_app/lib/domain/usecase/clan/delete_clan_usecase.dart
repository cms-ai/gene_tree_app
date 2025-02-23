import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';

class DeleteClanUsecase {
  final ClanRepository repo;

  DeleteClanUsecase(this.repo);

  Future<ClanEntity?> call(String clanId) async {
    final result = await repo.deleteClan(clanId);
    return result.data;
  }
}
