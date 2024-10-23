import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../ui/widgets/general_error_widget.dart';
import '../../../ui/widgets/no_data_screen.dart';
import '../bloc/pagination_bloc.dart';
import '../bloc/pagination_event.dart';
import 'footer.dart';

typedef CreatedCallback = void Function(PaginationBloc cubit);
typedef ListBuilder<Model> = Widget Function(List<Model> list);

class PaginationList<Model> extends StatefulWidget {
  final RepositoryCallBack? repositoryCallBack;
  final ListBuilder<Model>? listBuilder;
  final CreatedCallback? onCubitCreated;
  final bool? withPagination;
  final bool withEmptyWidget;
  final Map<String, dynamic>? initialParam;
  final VoidCallback? onRefresh;
  final Function()? onLoading;
  final Function()? onSuccess;
  final Axis scrollDirection;
  final Widget? errorWidget;
  final Widget? noDataWidget;
  final Widget? loadingWidget;
  final ScrollController? scrollController;

  const PaginationList(
      {super.key,
      this.noDataWidget,
      this.onSuccess,
      this.onLoading,
      this.scrollController,
      this.errorWidget,
      this.loadingWidget,
      this.scrollDirection = Axis.vertical,
      this.repositoryCallBack,
      this.listBuilder,
      this.withPagination = false,
      this.onCubitCreated,
      this.initialParam,
      this.withEmptyWidget = true,
      this.onRefresh});

  @override
  _PaginationListState<Model> createState() => _PaginationListState<Model>();
}

class _PaginationListState<Model> extends State<PaginationList<Model>> {
  final RefreshController _refreshController = RefreshController();
  PaginationBloc<Model>? bloc;

  @override
  void initState() {
    bloc = PaginationBloc<Model>(widget.repositoryCallBack!);
    if (widget.onCubitCreated != null) {
      widget.onCubitCreated!(bloc!);
    }
    bloc!.add(BasePaginationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildConsumer();
  }

  _buildConsumer() {
    return BlocProvider(
      create: (context) => bloc!..add(BasePaginationEvent()),
      child: BlocConsumer<PaginationBloc<Model>, PaginationState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is Error) {
            } else if (state is GetListSuccessfully) {
              if (widget.onSuccess != null) widget.onSuccess!();
              if (widget.onRefresh != null) widget.onRefresh!();
              _refreshController.refreshCompleted();

              if (state.noMoreData) {
                _refreshController.loadNoData();
              } else {
                _refreshController.loadComplete();
              }
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return widget.loadingWidget ??
                  const Center(child: CircularProgressIndicator());
            } else if (state is GetListSuccessfully) {
              return smartRefresher(state.list as List<Model>);
            } else if (state is Error) {
              return Center(
                child: widget.errorWidget ??
                    GeneralErrorWidget(
                      message: state.message,
                      onTap: () {
                        context
                            .read<PaginationBloc>()
                            .add(BasePaginationEvent());
                      },
                    ),
              );
            } else {
              return Container();
            }
          }),
    );
  }

  smartRefresher(List<Model> list) {
    Widget child;
    if (list.isEmpty && widget.withEmptyWidget) {
      child = widget.noDataWidget ?? const NoDataScreen();
    } else {
      child = widget.listBuilder!(list);
    }

    return SmartRefresher(
      scrollController: widget.scrollController,
      scrollDirection: widget.scrollDirection,
      enablePullDown: widget.scrollDirection == Axis.vertical,
      enablePullUp: widget.withPagination != null
          ? widget.withPagination!
          : widget.scrollDirection == Axis.vertical,
      header: const MaterialClassicHeader(),
      controller: _refreshController,
      onRefresh: () async {
        bloc!.add(BasePaginationEvent());
        if (widget.onLoading != null) widget.onLoading!();
      },
      onLoading: () async {
        bloc!.add(BasePaginationEvent(loadMore: true));
      },
      footer: customFooter,
      child: child,
    );
  }
}
