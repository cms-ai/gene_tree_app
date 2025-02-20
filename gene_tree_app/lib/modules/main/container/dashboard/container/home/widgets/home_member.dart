import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_member_entity.dart';
import 'package:gene_tree_app/modules/common/components/cm_avatar/cp_cm_avatar.dart';
import 'package:gene_tree_app/modules/main/container/dashboard/container/home/bloc/home_bloc.dart';
import 'package:gene_tree_app/modules/main/l10n/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class HomeMember extends StatefulWidget {
  const HomeMember({super.key});

  @override
  State<HomeMember> createState() => _HomeMemberState();
}

class _HomeMemberState extends State<HomeMember> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        SizedBox(height: 10.h),
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final status = state.clanMembers.status;
        switch (status) {
          case AsyncStatus.loading:
            return SizedBox(
              height: 70.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => _buildMemberSketeton(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 8.w,
                ),
              ),
            );
          case AsyncStatus.success:
            return SizedBox(
              height: 70.h,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.clanMembers.data?.length ?? 0,
                itemBuilder: (context, index) =>
                    _buildMemberItem(state.clanMembers.data?[index]),
                separatorBuilder: (context, index) => SizedBox(
                  width: 8.w,
                ),
              ),
            );
          default:
            return Container();
        }
      },
    );
  }

  Widget _buildMemberSketeton() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 48.h,
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 48.h,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50.r),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMemberItem(ClanMemberEntity? data) {
    return SizedBox(
      width: 48.h,
      child: Column(
        children: [
          CPCmAvatar(
            configs: CPCmAvatarConfigs(
              type: AvatarTypeEnum.network,
              size: 48.h,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            data?.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: themeData.value.typo.t10Semibold.copyWith(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.clanMembers != current.clanMembers ||
          previous.clanMembers.status != current.clanMembers.status,
      builder: (context, state) {
        final status = state.clanMembers.status;
        return Row(
          children: [
            Text(
              MainLocalizations.current.member,
              style: themeData.value.typo.t16Bold.copyWith(
                color: themeData.value.color.mainPrimaryColor,
              ),
            ),
            const Spacer(),
            if (status != AsyncStatus.loading)
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      MainLocalizations.current.viewAll,
                      style: themeData.value.typo.t10Bold.copyWith(
                        color: themeData.value.color.mainSecondaryColor1,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: themeData.value.color.mainSecondaryColor1,
                      size: 10.h,
                    )
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
