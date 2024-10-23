import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/getwidget.dart';
import 'package:real_estate/features/Realestate/bloc/realestate_bloc.dart';
import '../../../core/boilerplate/get_model/widgets/get_model.dart';
import '../../../core/constant/app_colors/app_colors.dart';
import '../../../core/ui/widgets/back_widget.dart';
import '../../../core/ui/widgets/cached_image.dart';
import '../bloc/realestate_state.dart';
import '../data/models/details.dart';
import '../widget/card_details.dart';
import '../widget/empty_block.dart';

class RealestateDetails extends StatefulWidget {
  final String realestateId;
  const RealestateDetails({super.key, required this.realestateId});

  @override
  RealestateDetailsState createState() => RealestateDetailsState();
}

class RealestateDetailsState extends State<RealestateDetails> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int page = _pageController.page!.round();
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RealestateBloc, RealestateState>(
          builder: (context, state) {
        return GetModel<RealestateDetailsModel>(
          useCaseCallBack: () {
            return context
                .read<RealestateBloc>()
                .fetchOneRealEstate(widget.realestateId);
          },
          onError: (val) {
            debugPrint(val);
          },
          modelBuilder: (model) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  const BackWidget(title: "Real Estate Details"),
                  SizedBox(height: 20.h),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: ScreenUtil().screenWidth,
                          height: ScreenUtil().screenHeight * 0.5,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: model.images?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().screenWidth * 0.1),
                                child: CachedImage(
                                  imageUrl: model.images![index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().screenHeight * 0.01,
                        right: ScreenUtil().screenWidth * 0.3,
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                          child: Card(
                            color: AppColors.white,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(ScreenUtil().setWidth(16)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    model.price != null
                                        ? "IQD ${model.price!.toStringAsFixed(3)}"
                                        : "Price",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "/month",
                                    style: TextStyle(
                                      color: AppColors.grey3B,
                                      fontSize: ScreenUtil().setSp(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: ScreenUtil().screenHeight * 0.02,
                        right: ScreenUtil().screenWidth * 0.02,
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.visibility,
                                color: AppColors.grey3B,
                              ),
                              SizedBox(width: ScreenUtil().setWidth(8)),
                              Text(
                                '${model.views ?? "0"}',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(16),
                                  color: AppColors.grey3B,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  model.images != null && model.images!.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            model.images!.length,
                            (index) => Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(4)),
                              width: ScreenUtil().setWidth(8),
                              height: ScreenUtil().setHeight(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index
                                    ? AppColors.babyBlue
                                    : AppColors.grey3B,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: ScreenUtil().setWidth(260),
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: model.title ?? "Title",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: ScreenUtil().setHeight(8),
                          left: ScreenUtil().setWidth(16),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Offer Type: ${model.offerType ?? "Offer Type"}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                              fontSize: ScreenUtil().setSp(16),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CardDetails(
                            text: model.noOfBedRooms?.toString() ?? "0",
                            text2: "Beds",
                            icon: Icons.bed_outlined,
                          ),
                          CardDetails(
                            text: model.noOfBathRooms?.toString() ?? "0",
                            icon: Icons.bathroom_outlined,
                            text2: "Bath",
                          ),
                          CardDetails(
                            text: model.area?.toString() ?? "0",
                            icon: Icons.crop_free_rounded,
                            text2: "M",
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                        child: Text(
                          "Details",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(16),
                            bottom: ScreenUtil().setHeight(8)),
                        child: Text(
                          "Country: ${model.country?.name.toString() ?? "Country"}",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(16),
                            bottom: ScreenUtil().setHeight(8)),
                        child: Text(
                          "City: ${model.city?.name.toString() ?? "City"}",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(16),
                            bottom: ScreenUtil().setHeight(8)),
                        child: Text(
                          "District: ${model.district?.name.toString() ?? "District"}",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(16),
                            bottom: ScreenUtil().setHeight(8)),
                        child: Text(
                          "Sub District: ${model.subDistrict?.name.toString() ?? "Sub District"}",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(16),
                            bottom: ScreenUtil().setHeight(8)),
                        child: Text(
                          "Category: ${model.category?.name.toString() ?? "Category"}",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(16),
                            bottom: ScreenUtil().setHeight(8)),
                        child: Text(
                          "Sub Category: ${model.subCategory?.name.toString() ?? "Sub Category"}",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(16),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          loading: SingleChildScrollView(
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
        );
      }),
    );
  }
}
