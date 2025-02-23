import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/clan/request/create_clan_request.dart';
import 'package:gene_tree_app/data/models/clan/request/update_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';

abstract class ClanRepository {
  Future<BaseResponse<ClanEntity>> createClan(CreateClanRequest body);
  Future<BaseResponse<ClanEntity>> updateClan(
    String clanId,
    UpdateClanRequest body,
  );
  Future<BaseResponse<List<ClanEntity>>> getAllClanById(String userId);
  Future<BaseResponse<List<ClanEventEntity>>> getClanEventsByClanId(
    String clanId,
  );
  Future<BaseResponse<List<ClanMemberEntity>>> getClanMembersById(
    String clanId,
  );
  Future<BaseResponse<ClanEntity?>> deleteClan(
    String clanId,
  );
}
