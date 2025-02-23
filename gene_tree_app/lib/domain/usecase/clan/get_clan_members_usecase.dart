import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';

class GetClanMembersUsecase {
  final ClanRepository repo;

  GetClanMembersUsecase(this.repo);

  Future<List<ClanMemberEntity>> call(String clanId) async {
    final result = await repo.getClanMembersById(clanId);
    return result.data ?? [];
  }
}
