import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/data/models/clan/request/create_clan_request.dart';
import 'package:gene_tree_app/data/models/clan/request/update_clan_request.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_event_entity.dart';
import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'clan_api_service.g.dart';

@RestApi()
abstract class ClanApiService {
  factory ClanApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ClanApiService;

  @POST("/clan/create")
  Future<BaseResponse<ClanEntity>> createClan(
    @Body() CreateClanRequest? body,
  );

  @PUT("/clan/{id}")
  Future<BaseResponse<ClanEntity>> update(
    @Path('id') String clanId,
    @Body() UpdateClanRequest? body,
  );

  @DELETE("/clan/{id}")
  Future<BaseResponse<ClanEntity?>> delete(
    @Path('id') String clanId,
  );

  @GET("/clan/all")
  Future<BaseResponse<List<ClanEntity>>> getAllWithId(
    @Query("user_id") String userId,
  );

  @GET("/clan/{id}/clan-events")
  Future<BaseResponse<List<ClanEventEntity>>> getClanEvents(
    @Path('id') String clanId,
  );

  @GET("/clan/{id}/members")
  Future<BaseResponse<List<ClanMemberEntity>>> getClanMembers(
    @Path('id') String clanId,
  );
}
