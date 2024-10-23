import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/widgets/general_error_widget.dart';
import '../bloc/get_model_bloc.dart';
import '../bloc/get_model_event.dart';

typedef CreatedCallback = void Function(GetModelBloc bloc);
typedef ModelBuilder<Model> = Widget Function(Model model);
typedef ModelReceived<Model> = Function(Model model);

class GetModel<Model> extends StatefulWidget {
  final double? loadingHeight;
  final Widget? loading;
  final Widget? errorWidget;
  final Function? onError;
  final ModelBuilder<Model>? modelBuilder;
  final ModelReceived<Model>? onSuccess;
  final UseCaseCallBack? useCaseCallBack;
  final CreatedCallback? onCubitCreated;
  final bool withAnimation;
  final bool withoutCenterLoading;

  const GetModel({
    super.key,
    this.useCaseCallBack,
    this.onCubitCreated,
    this.errorWidget,
    this.modelBuilder,
    this.onSuccess,
    this.loadingHeight,
    this.loading,
    this.onError,
    this.withAnimation = true,
    this.withoutCenterLoading = false,
  });

  @override
  State<GetModel<Model>> createState() => _GetModelState<Model>();
}

class _GetModelState<Model> extends State<GetModel<Model>> {
  late GetModelBloc<Model> bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetModelBloc<Model>(widget.useCaseCallBack!);
    if (widget.onCubitCreated != null) {
      widget.onCubitCreated!(bloc);
    }
    bloc.add(BaseGetModelEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<GetModelBloc<Model>, GetModelState>(
        listener: (context, state) {
          if (state is Error) {
            if (widget.onError != null) {
              widget.onError!();
            }
          } else if (state is GetModelSuccessfully) {
            if (widget.onSuccess != null) {
              widget.onSuccess!(state.model);
            }
          }
        },
        builder: (context, state) {
          debugPrint(state.toString());
          if (state is Loading) {
            return SizedBox(
                height: widget.loadingHeight,
                child: widget.withoutCenterLoading
                    ? widget.loading
                    : Center(
                        child: widget.loading ??
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: CircularProgressIndicator(),
                            ),
                      ));
          } else if (state is GetModelSuccessfully) {
            return buildModel(state.model);
          } else if (state is Error) {
            return Center(
              child: widget.errorWidget ??
                  GeneralErrorWidget(
                    message: state.message,
                    onTap: () {
                      bloc.add(BaseGetModelEvent());
                    },
                  ),
            );
          } else {
            return const Text('');
          }
        },
      ),
    );
  }

  Widget buildModel(Model model) {
    return RefreshIndicator(
      child: widget.modelBuilder!(model),
      onRefresh: () {
        bloc.add(BaseGetModelEvent());
        return Future.delayed(const Duration(seconds: 1));
      },
    );
  }
}
