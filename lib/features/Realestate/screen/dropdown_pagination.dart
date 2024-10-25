import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/core/constant/app_colors/app_colors.dart';
import 'package:real_estate/features/Realestate/widget/dropdown_paginatied.dart';
import '../../../core/boilerplate/pagination/models/get_list_request.dart';
import '../../../core/results/result.dart';
import '../bloc/realestate_bloc.dart';
import '../bloc/realestate_state.dart';
import '../data/models/realestate.dart';

class SSS extends StatelessWidget {
  const SSS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<RealestateBloc, RealestateState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    DropDownPaginated<RealestateModel>(
                      onError: (String? error) {
                        if (kDebugMode) {
                          print('Error occurred: $error');
                        }
                      },
                      paginatedDataApi: (int? page, String? searchText) async {
                        final request = GetListRequest(page: page);
                        final paginatedData = await context
                            .read<RealestateBloc>()
                            .fetchAllRealEstate(request);

                        return Result<List<RealestateModel>>(
                          data: paginatedData.data,
                          error: paginatedData.error,
                        );
                      },
                      labelBuilder: (RealestateModel value) {
                        return value.id ?? "";
                      },
                      childBuilder: (RealestateModel value) {
                        return ListTile(
                          title: Text(value.id ?? ""),
                          subtitle: Text("ID: ${value.id}"),
                        );
                      },
                      onTap: (RealestateModel value) {
                        if (kDebugMode) {
                          print('Selected ID: ${value.id}');
                        }
                      },
                      icon: Icons.delete,
                      iconColor: AppColors.babyBlue,
                      hintText: "Choose anything",
                      isEnabled: true,
                      leadingIcon: Icons.person,
                    ),
                    DropDownPaginated<RealestateModel>(
                      onError: (String? error) {
                        if (kDebugMode) {
                          print('Error occurred: $error');
                        }
                      },
                      paginatedDataApi: (int? page, String? searchText) async {
                        final request = GetListRequest(page: page);
                        final paginatedData = await context
                            .read<RealestateBloc>()
                            .fetchAllRealEstate(request);

                        return Result<List<RealestateModel>>(
                          data: paginatedData.data,
                          error: paginatedData.error,
                        );
                      },
                      labelBuilder: (RealestateModel value) {
                        return value.id ?? "";
                      },
                      childBuilder: (RealestateModel value) {
                        return ListTile(
                          title: Text(value.id ?? ""),
                          subtitle: Text("ID: ${value.id}"),
                        );
                      },
                      onTap: (RealestateModel value) {
                        if (kDebugMode) {
                          print('Selected ID: ${value.id}');
                        }
                      },
                      icon: Icons.delete,
                      iconColor: AppColors.babyBlue,
                      hintText: "Choose anything",
                      isEnabled: true,
                      leadingIcon: Icons.person,
                    ),
                  ],
                ),
                DropDownPaginated<RealestateModel>(
                  onError: (String? error) {
                    if (kDebugMode) {
                      print('Error occurred: $error');
                    }
                  },
                  paginatedDataApi: (int? page, String? searchText) async {
                    final request = GetListRequest(page: page);
                    final paginatedData = await context
                        .read<RealestateBloc>()
                        .fetchAllRealEstate(request);

                    return Result<List<RealestateModel>>(
                      data: paginatedData.data,
                      error: paginatedData.error,
                    );
                  },
                  labelBuilder: (RealestateModel value) {
                    return value.id ?? "";
                  },
                  childBuilder: (RealestateModel value) {
                    return ListTile(
                      title: Text(value.id ?? ""),
                      subtitle: Text("ID: ${value.id}"),
                    );
                  },
                  onTap: (RealestateModel value) {
                    if (kDebugMode) {
                      print('Selected ID: ${value.id}');
                    }
                  },
                  icon: Icons.delete,
                  iconColor: AppColors.babyBlue,
                  hintText: "Choose anything",
                  isEnabled: true,
                  leadingIcon: Icons.person,
                ),
                Row(
                  children: [
                    DropDownPaginated<RealestateModel>(
                      onError: (String? error) {
                        if (kDebugMode) {
                          print('Error occurred: $error');
                        }
                      },
                      paginatedDataApi: (int? page, String? searchText) async {
                        final request = GetListRequest(page: page);
                        final paginatedData = await context
                            .read<RealestateBloc>()
                            .fetchAllRealEstate(request);

                        return Result<List<RealestateModel>>(
                          data: paginatedData.data,
                          error: paginatedData.error,
                        );
                      },
                      labelBuilder: (RealestateModel value) {
                        return value.id ?? "";
                      },
                      childBuilder: (RealestateModel value) {
                        return ListTile(
                          title: Text(value.id ?? ""),
                          subtitle: Text("ID: ${value.id}"),
                        );
                      },
                      onTap: (RealestateModel value) {
                        if (kDebugMode) {
                          print('Selected ID: ${value.id}');
                        }
                      },
                      icon: Icons.delete,
                      iconColor: AppColors.babyBlue,
                      hintText: "Choose anything",
                      isEnabled: true,
                      leadingIcon: Icons.person,
                    ),
                    DropDownPaginated<RealestateModel>(
                      onError: (String? error) {
                        if (kDebugMode) {
                          print('Error occurred: $error');
                        }
                      },
                      paginatedDataApi: (int? page, String? searchText) async {
                        final request = GetListRequest(page: page);
                        final paginatedData = await context
                            .read<RealestateBloc>()
                            .fetchAllRealEstate(request);

                        return Result<List<RealestateModel>>(
                          data: paginatedData.data,
                          error: paginatedData.error,
                        );
                      },
                      labelBuilder: (RealestateModel value) {
                        return value.id ?? "";
                      },
                      childBuilder: (RealestateModel value) {
                        return ListTile(
                          title: Text(value.id ?? ""),
                          subtitle: Text("ID: ${value.id}"),
                        );
                      },
                      onTap: (RealestateModel value) {
                        if (kDebugMode) {
                          print('Selected ID: ${value.id}');
                        }
                      },
                      icon: Icons.delete,
                      iconColor: AppColors.babyBlue,
                      hintText: "Choose anything",
                      isEnabled: true,
                      leadingIcon: Icons.person,
                    ),
                  ],
                )
              ],
            );
          },
        ));
  }
}
