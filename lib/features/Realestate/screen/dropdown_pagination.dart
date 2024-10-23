import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';

import '../../../core/boilerplate/pagination/models/get_list_request.dart';
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
            return HighQPaginatedDropdown<RealestateModel>.paginated(
              paginatedRequest: (int? page, String? searchText) async {
                final request = GetListRequest(
                  page: page,
                );

                final paginatedData = await context
                    .read<RealestateBloc>()
                    .fetchAllRealEstate(request); 

                return paginatedData.data!
                    .map<MenuItemModel<RealestateModel>>((e) {
                  return MenuItemModel<RealestateModel>(
                    value: e,
                    onTap: () {
                      if (kDebugMode) {
                        print(e.id);
                      }
                    },
                    label: "label",
                    child: Text(e.id),
                  );
                }).toList();
              },
              backgroundDecoration: (Widget child) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.red),
                  ),
                  child: child,
                );
              },
            );
          },
        ));
  }
}
