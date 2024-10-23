import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';
import 'package:real_estate/features/Realestate/data/models/category.dart';
import 'package:real_estate/features/Realestate/data/models/city.dart';
import 'package:real_estate/features/Realestate/data/models/realestate.dart';
import '../../../core/boilerplate/get_model/widgets/get_model.dart';
import '../../../core/boilerplate/pagination/widgets/pagination_list.dart';
import '../../../core/ui/widgets/back_widget.dart';
import '../bloc/realestate_bloc.dart';
import '../bloc/realestate_event.dart';
import '../bloc/realestate_state.dart';
import '../data/models/names.dart';
import '../widget/realestate_card.dart';
import '../widget/dropdown.dart';
import '../widget/dropdown_shimmer.dart';
import '../widget/empty_block.dart';

class RealestateScreen extends StatelessWidget {
  const RealestateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteF1,
      body: BlocBuilder<RealestateBloc, RealestateState>(
        builder: (context, state) {
          final currentValue = context.watch<RealestateBloc>().offerType;
          final isSell = currentValue == 'SELL';
          context.read<RealestateBloc>().add(GetStoredCityEvent());
          context.read<RealestateBloc>().add(GetStoredCategoryEvent());
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 70.h),
                const BackWidget(title: "Real Estate"),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedToggleSwitch.dual(
                      current: isSell,
                      first: false,
                      second: true,
                      spacing: 20.w,
                      height: 50.h,
                      borderWidth: 1.w,
                      onChanged: (value) {
                        context.read<RealestateBloc>().add(
                            ChangeFilterOfferTypeEvent(
                                value ? 'SELL' : 'RENT'));
                      },
                      styleBuilder: (value) => ToggleStyle(
                        indicatorColor: value ? Colors.red : Colors.green,
                        borderColor: Colors.transparent,
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      iconBuilder: (value) => Icon(
                        value ? Icons.sell : Icons.real_estate_agent_rounded,
                        size: 24.sp,
                      ),
                      textBuilder: (value) => Center(
                        child: Text(
                          value ? "SELL" : "RENT",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: IntrinsicWidth(
                        child: Row(
                          children: [
                            context.read<RealestateBloc>().city?.isEmpty ?? true
                                ? Expanded(
                                    child: GetModel<List<CityModel>>(
                                      useCaseCallBack: () {
                                        return context
                                            .read<RealestateBloc>()
                                            .fetchAllCities();
                                      },
                                      onSuccess: (model) {
                                        context
                                            .read<RealestateBloc>()
                                            .add(SetInitialCityEvent(model));
                                      },
                                      onError: (val) {
                                        debugPrint(val);
                                      },
                                      modelBuilder: (model) {
                                        return const SizedBox();
                                      },
                                      loading: const GFShimmer(
                                        child: ShimmerDD(),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: DropDownWidget<CityModel>(
                                      value: context
                                          .read<RealestateBloc>()
                                          .selectedCity,
                                      onChanged: (CityModel? newCity) {
                                        if (newCity != null &&
                                            newCity !=
                                                context
                                                    .read<RealestateBloc>()
                                                    .selectedCity) {
                                          context
                                              .read<RealestateBloc>()
                                              .cityId = newCity.id!;
                                          context.read<RealestateBloc>().add(
                                              ChangeSelectedCityEvent(newCity));
                                          context.read<RealestateBloc>().add(
                                              ChangeFilterCityTypeEvent(
                                                  newCity.id!));
                                        }
                                      },
                                      items: context
                                              .read<RealestateBloc>()
                                              .city
                                              ?.map<
                                                      DropdownMenuItem<
                                                          CityModel>>(
                                                  (CityModel city) {
                                            return DropdownMenuItem<CityModel>(
                                              value: city,
                                              child:
                                                  Text(city.names?.enUS ?? ''),
                                            );
                                          }).toList() ??
                                          [],
                                      hint: "City",
                                      allValue: CityModel(
                                          id: "",
                                          names: NamesModel(enUS: 'All')),
                                    ),
                                  ),
                            context.read<RealestateBloc>().category?.isEmpty ??
                                    true
                                ? Expanded(
                                    child: GetModel<List<CategoryModel>>(
                                      useCaseCallBack: () {
                                        return context
                                            .read<RealestateBloc>()
                                            .fetchAllCategory();
                                      },
                                      onSuccess: (model) {
                                        context.read<RealestateBloc>().add(
                                            SetInitialCategoryEvent(model));
                                      },
                                      onError: (val) {
                                        debugPrint(val);
                                      },
                                      modelBuilder: (model) {
                                        return const SizedBox();
                                      },
                                      loading: const GFShimmer(
                                        child: ShimmerDD(),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: DropDownWidget<CategoryModel>(
                                      hint: "Category",
                                      allValue: CategoryModel(
                                          id: "",
                                          names: NamesModel(enUS: 'All')),
                                      value: context
                                          .read<RealestateBloc>()
                                          .selectedCategory,
                                      items: context
                                              .read<RealestateBloc>()
                                              .category
                                              ?.map<
                                                      DropdownMenuItem<
                                                          CategoryModel>>(
                                                  (CategoryModel category) {
                                            return DropdownMenuItem<
                                                CategoryModel>(
                                              value: category,
                                              child: Text(
                                                  category.names?.enUS ?? ''),
                                            );
                                          }).toList() ??
                                          [],
                                      onChanged: (CategoryModel? newCategory) {
                                        if (newCategory != null &&
                                            newCategory !=
                                                context
                                                    .read<RealestateBloc>()
                                                    .selectedCategory) {
                                          context
                                              .read<RealestateBloc>()
                                              .subCategoryId = newCategory.id;
                                          context.read<RealestateBloc>().add(
                                              ChangeSelectedCategoryEvent(
                                                  newCategory));
                                          context.read<RealestateBloc>().add(
                                              ChangeFilterCategoryTypeEvent(
                                                  newCategory.id!));
                                        }
                                      },
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: PaginationList<RealestateModel>(
                    withPagination: true,
                    loadingWidget: SingleChildScrollView(
                      child: Column(
                        children: [
                          const GFShimmer(
                            child: EmptyBlock(),
                          ),
                          SizedBox(height: 16.h),
                          const GFShimmer(
                            child: EmptyBlock(),
                          ),
                          SizedBox(height: 16.h),
                          const GFShimmer(
                            child: EmptyBlock(),
                          ),
                          SizedBox(height: 16.h),
                          const GFShimmer(
                            child: EmptyBlock(),
                          ),
                          SizedBox(height: 16.h),
                          const GFShimmer(
                            child: EmptyBlock(),
                          ),
                        ],
                      ),
                    ),
                    onCubitCreated: (cubit) {
                      context.read<RealestateBloc>().realestateBloc = cubit;
                    },
                    repositoryCallBack: (data) {
                      return context
                          .read<RealestateBloc>()
                          .fetchAllRealEstate(data);
                    },
                    listBuilder: (list) => ListView.separated(
                      itemBuilder: (context, index) {
                        return CardWid(
                          realEstateModel: list[index],
                        );
                      },
                      itemCount: list.length,
                      padding: EdgeInsets.only(
                        bottom: 100.h,
                        top: 16.h,
                      ),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 16.h);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
