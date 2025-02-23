// lib/data/data_sources/auth/auth_api_service.dart
import 'package:dio/dio.dart';
import 'package:gene_tree_app/core/network/base_response.dart';
import 'package:gene_tree_app/domain/entities/clan_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'clan_event_api_service.g.dart';

@RestApi()
abstract class ClanEventApiService {
  factory ClanEventApiService(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ClanEventApiService;

  @POST("/clan-event/create")
  Future<BaseResponse<List<ClanEntity>>> createClanEvent(
    @Query("clan_id") String userId,
  );
}
