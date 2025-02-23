import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/api_services/clan_api_service.dart';
import 'package:gene_tree_app/data/models/clan/request/create_clan_request.dart';
import 'package:gene_tree_app/data/models/clan/request/update_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';
import 'package:gene_tree_app/domain/repositories/clan_repository.dart';

class ClanRepositoryImpl implements ClanRepository {
  final ClanApiService clanApiService;

  const ClanRepositoryImpl(this.clanApiService);

  @override
  Future<BaseResponse<ClanEntity>> createClan(CreateClanRequest body) {
    return clanApiService.createClan(body);
  }

  @override
  Future<BaseResponse<List<ClanEntity>>> getAllClanById(String userId) {
    return clanApiService.getAllWithId(userId);
  }

  @override
  Future<BaseResponse<List<ClanEventEntity>>> getClanEventsByClanId(
    String clanId,
  ) {
    return clanApiService.getClanEvents(clanId);
  }

  @override
  Future<BaseResponse<ClanEntity>> updateClan(
      String clanId, UpdateClanRequest body) {
    return clanApiService.update(clanId, body);
  }

  @override
  Future<BaseResponse<ClanEntity?>> deleteClan(String clanId) {
    return clanApiService.delete(clanId);
  }

  @override
  Future<BaseResponse<List<ClanMemberEntity>>> getClanMembersById(
      String clanId) {
    return clanApiService.getClanMembers(clanId);
  }
}
