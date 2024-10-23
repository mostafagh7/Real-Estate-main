import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';
import 'package:real_estate/core/constant/app_padding/app_padding.dart';
import '../../../core/results/result.dart';

class DropDownPaginated<Model> extends StatelessWidget {
  final Future<Result<List<Model>>> Function(int? page, String? searchText)
      paginatedDataApi;
  final Model? selectedValue;
  final void Function(Model value)? onTap;
  final String Function(Model value) labelBuilder;
  final Widget Function(Model value) childBuilder;
  final void Function(String? error) onError;
  final IconData? icon;
  final IconData? leadingIcon;
  final Color? iconColor;
  final Color? leadingIconColor;
  final PaginatedSearchDropdownController<Model>? controller;
  final String? hintText;
  final bool? isEnabled;
  final bool? isDialogExpanded;

  const DropDownPaginated({
    super.key,
    required this.paginatedDataApi,
    this.selectedValue,
    this.onTap,
    required this.labelBuilder,
    required this.childBuilder,
    required this.onError,
    this.icon,
    this.iconColor,
    this.controller,
    this.hintText,
    this.isEnabled,
    this.isDialogExpanded,
    this.leadingIcon,
    this.leadingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return HighQPaginatedDropdown<Model>.paginated(
      paginatedRequest: (int? page, String? searchText) async {
        final result = await paginatedDataApi(page, searchText);

        if (result.hasDataOnly) {
          final paginatedData = result.data!;
          return paginatedData.map<MenuItemModel<Model>>((model) {
            return MenuItemModel<Model>(
              value: model,
              onTap: () {
                if (onTap != null) {
                  onTap!(model);
                }
              },
              label: labelBuilder(model),
              child: childBuilder(model),
            );
          }).toList();
        } else {
          onError(result.error);
          return [];
        }
      },
      backgroundDecoration: (Widget child) {
        return Padding(
          padding: const EdgeInsets.all(AppPaddingSize.padding_10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPaddingSize.padding_10),
              border: Border.all(color: AppColors.grey3B),
            ),
            child: child,
          ),
        );
      },
      trailingClearIcon: Icon(
        icon,
        color: iconColor,
      ),
      controller: controller,
      hintText: Text(hintText ?? "",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
      isEnabled: isEnabled ?? true,
      isDialogExpanded: isDialogExpanded ?? true,
      leadingIcon: Icon(
        leadingIcon,
        color: leadingIconColor,
      ),
    );
  }
}
