import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gene_tree_app/core/utils/theme/bloc/theme_bloc.dart';
import 'package:gene_tree_app/domain/entities/clan_transaction_entity.dart';
import 'package:gene_tree_app/gen/assets.gen.dart';
import 'package:gene_tree_app/modules/common/components/base_scaffold/base_scaffold.dart';
import 'package:gene_tree_app/modules/common/components/base_screen/base_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gene_tree_app/modules/common/components/button/cp_button.dart';
import 'package:gene_tree_app/modules/common/components/cm_app_bar/cp_cm_app_bar.dart';
import './bloc/clan_trans_list_bloc.dart';
part './models/clan_trans_list_argument.dart';

class ClanTransListScreen extends StatefulWidget {
  const ClanTransListScreen({
    super.key,
    this.argument,
  });
  final ClanTransListArgument? argument;

  @override
  State<ClanTransListScreen> createState() => _ClanTransListScreenState();
}

class _ClanTransListScreenState extends State<ClanTransListScreen> {
  @override
  Widget build(BuildContext context) {
    final ClanTransListBloc bloc = Modular.get<ClanTransListBloc>();

    return BaseScreen(
      scaffoldBuilder: () {
        return BlocProvider.value(
          value: bloc,
          child: BaseScaffold(
            configs: BaseScaffoldConfigs(
              appBar: const CPCmAppBar(
                configs: CPCmAppBarConfigs(
                  title: "Transaction",
                ),
              ),
              nameScreen: "ClanTransList",
              body: (themeState) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: themeData.value.spacing.screenHorizontal,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildAmount(),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                            color: themeData.value.color.btnColor2,
                            // .withOpacity(.05),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Row(
                          children: [
                            ...List.generate(
                              TransactionType.values.length,
                              (index) => Expanded(
                                child: CPButton(
                                  configs: CPButtonConfigs(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6.h, horizontal: 4.w),
                                    content:
                                        TransactionType.values[index].title(),
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      color: index == 0
                                          ? themeData
                                              .value.color.mainSecondaryColor1
                                          : Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(14.r), // Bo góc
                                    ),
                                    textStyle: themeData.value.typo.t10Semibold
                                        .copyWith(),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => _buildTransaction(
                            index == 0
                                ? TransactionType.income
                                : TransactionType.expense),
                        separatorBuilder: (context, index) =>
                            Container(height: 10.h),
                        itemCount: 5,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTransaction(TransactionType type) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Row(
              children: [
                // Icon(Icons.down)
                type == TransactionType.expense
                    ? Assets.icons.icExpense.image(
                        height: 20.h,
                        color: Colors.red,
                      )
                    : Assets.icons.icIncome.image(
                        height: 20.h,
                        color: Colors.green,
                      ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text("Send Money",
                      style: themeData.value.typo.t12Regular),
                ),
                Text(
                  "-3tr",
                  style: themeData.value.typo.t12Regular.copyWith(
                    color: type == TransactionType.expense
                        ? Colors.red
                        : Colors.green,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Divider(
              color: themeData.value.color.mainPrimaryColor.withOpacity(.5),
              thickness: 1,
              indent: 1,
            ),
          )
        ],
      );

  Widget _buildAmount() => Column(
    children: [
      Text(
        'Spent',
        style: themeData.value.typo.t14Semibold.copyWith(
          color: themeData.value.color.mainPrimaryColor.withOpacity(.5),
        ),
      ),
      SizedBox(height: 6.h),
      Text(
        r'$ 2300',
        style: themeData.value.typo.tHeader.copyWith(
          color: themeData.value.color.mainSecondaryColor1,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 6.h),
      Text(
        r'From $25000',
        style: themeData.value.typo.t14Semibold.copyWith(
          color: themeData.value.color.mainPrimaryColor.withOpacity(.5),
        ),
      )
    ],
  );
}
