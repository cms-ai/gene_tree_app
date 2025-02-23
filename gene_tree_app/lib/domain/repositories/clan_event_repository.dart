import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/clan/request/create_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';

abstract class ClanEventRepository {
  Future<BaseResponse<ClanEntity>> createClanEvent(CreateClanRequest body);
  Future<BaseResponse<List<ClanEntity>>> getAllClanEventById(String clanId);
}
