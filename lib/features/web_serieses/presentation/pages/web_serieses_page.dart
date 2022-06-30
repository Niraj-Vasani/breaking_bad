import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../cubit/web_serieses_cubit.dart';
import '../widgets/web_serieses_body_widget.dart';

class WebSeriesesPage extends StatelessWidget {
  const WebSeriesesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            StringConst.sPopularSerieses,
          ),
        ),
        body: BlocBuilder<WebSeriesesCubit, WebSeriesesState>(
          builder: (context, state) {
            if (state is WebSeriesesInitial || state is WebSeriesesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WebSeriesesLoaded) {
              return WebSeriesesBodyWidget(
                serieses: state.serieses,
              );
            } else if (state is WebSeriesesError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text(StringConst.sSomethingWentWrong),
              );
            }
          },
        ),
      ),
    );
  }
}
