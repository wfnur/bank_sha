import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthFailed){
            showCustomSnackbar(context, state.e);
          }

          if(state is AuthSuccess){
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if(state is AuthLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      title: 'Old Pin',
                      controller: oldPinController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      title: 'New Pin',
                      controller: newPinController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthUpdatePin(oldPinController.text, newPinController.text));
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
