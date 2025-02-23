import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/exceptions/exceptions.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';
import 'package:gene_tree_app/domain/usecase/clan/get_clan_members_usecase.dart';

part 'clan_member_list_event.dart';
part 'clan_member_list_state.dart';
part 'clan_member_list_bloc.freezed.dart';

class ClanMemberListBloc
    extends Bloc<ClanMemberListEvent, ClanMemberListState> {
  final GetClanMembersUsecase getClanMembersUsecase;
  ClanMemberListBloc(
    this.getClanMembersUsecase,
  ) : super(
          const ClanMemberListState.initial(
            members: AsyncValue.loading(),
          ),
        ) {
    on<ClanMemberListEvent>((event, emit) async {
      await event.map(started: (value) async {
        try {
          emit(state.copyWith(members: const AsyncValue.loading()));
          final membersRes = await getClanMembersUsecase.call(value.clanId);

          emit(state.copyWith(members: AsyncValue.success(membersRes)));
        } catch (e) {
          final error = await e.getMessageErr() ?? "";
          emit(state.copyWith(members: AsyncValue.error(error)));
        }
      });
    });
  }
}
