import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:single_result_bloc/single_result_bloc.dart';
import 'package:flutter_template_project/arch/custom_toast/custom_toast.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_event.dart';
import 'package:flutter_template_project/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter_template_project/features/splash/presentation/widgets/splash_failed.dart';
import 'package:flutter_template_project/features/splash/presentation/widgets/splash_loading.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(const SplashEvent.initialize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Expanded(
          flex: 3,
          child: SingleResultBlocBuilder<SplashBloc, SplashState,
              SplashSingleResult>(
            onSingleResult: (context, singleResult) => singleResult.when(
              failure: (failure) =>
                  CustomToast(context).showTextFailureToast(failure.when(
                connectionFailure: () =>
                    'Ошибка соединения с сервером. Проверьте подключение к интернету',
                serverFailure: (statusCode) =>
                    'Произошла ошибка на сервере ($statusCode). Свяжитесь с разработчиком',
                unknownFailure: () =>
                    'Произошла неожиданная ошибка. Свяжитесь с разработчиком',
              )),
            ),
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SplashLoading(),
              failure: (_) => const SplashFailed(),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
