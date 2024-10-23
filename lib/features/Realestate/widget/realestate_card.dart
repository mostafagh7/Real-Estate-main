import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';
import '../../../core/ui/widgets/cached_image.dart';
import '../../../core/utils/Navigation/navigation.dart';
import '../data/models/realestate.dart';
import '../screen/realestate_details.dart';

class CardWid extends StatelessWidget {
  final RealestateModel realEstateModel;

  const CardWid({
    super.key,
    required this.realEstateModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigation.push(RealestateDetails(
        realestateId: realEstateModel.id ?? "",
      )),
      child: Card(
        color: AppColors.whiteF0,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 0.25.sh, 
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.w),
                    child: CachedImage(
                      imageUrl: realEstateModel.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Card(
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            realEstateModel.price != null
                                ? "IQD ${realEstateModel.price!.toStringAsFixed(3)}"
                                : "Price",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "/month",
                            style: TextStyle(
                              color: AppColors.grey3B,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h, 
                  right: 8.w, 
                  child: Row(
                    children: [
                      const Icon(
                        Icons.visibility,
                        color: AppColors.grey3B,
                      ),
                      SizedBox(width: 8.w), 
                      Text(
                        '${realEstateModel.views}',
                        style: TextStyle(
                          fontSize: 16.sp, 
                          color: AppColors.grey3B,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 0.6.sw,
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: realEstateModel.title ?? "Title",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.h, 
                        left: 12.w,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Offer Type: ${realEstateModel.offerType ?? "Offer Type"}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                            fontSize: 16.sp, 
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
