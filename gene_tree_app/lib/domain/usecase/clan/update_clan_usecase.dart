import 'package:gene_tree_app/data/models/clan/request/update_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';

class UpdateClanUsecase {
  final ClanRepository repo;

  UpdateClanUsecase(this.repo);

  Future<ClanEntity?> call(String clanId, UpdateClanRequest body) async {
    final result = await repo.updateClan(clanId, body);
    return result.data;
  }
}
