
import 'package:arabitac/core/base/base_states.dart';
import 'package:arabitac/logic/profile/profile_cubit.dart';
import 'package:arabitac/widgets/error_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.state == BaseState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == BaseState.loaded) {
            return _buildProfile(context);
          } else if (state.state == BaseState.error) {
            return ErrorLayout(
              errorModel: state.error,
              onRetry: () => context.read<ProfileCubit>().getProfile(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return Container();
  }
}
