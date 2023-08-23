
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenerateMultiBloc extends StatelessWidget {
  final Widget child;

  const GenerateMultiBloc({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        // BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit()),
        // //*Profile
        // BlocProvider<ProfileCubit>(
        //     create: (BuildContext context) => ProfileCubit(getIt())),
      ],
      child: child,
    );
  }
}
