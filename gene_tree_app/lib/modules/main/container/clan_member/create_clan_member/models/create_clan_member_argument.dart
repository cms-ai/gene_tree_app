part of '../create_clan_member_screen.dart';

enum CreateClanMemberScreenType {
  create,
  update,
}

class CreateClanMemberArgument {
  const CreateClanMemberArgument({
    CreateClanMemberScreenType type = CreateClanMemberScreenType.create,
  });
}
