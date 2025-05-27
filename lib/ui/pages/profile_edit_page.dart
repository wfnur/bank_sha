import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/user_edit_form_model.dart';
import 'package:bank_sha/shared/shared_method.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/widgets/buttons.dart';
import 'package:bank_sha/ui/pages/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    final authstate = context.read<AuthBloc>().state;
    if (authstate is AuthSuccess) {
      usernameController.text = authstate.user.username!;
      nameController.text = authstate.user.name!;
      emailController.text = authstate.user.email!;
      passwordController.text = authstate.user.password!;
    }
  }

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
              child:CircularProgressIndicator()
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
                    //NOTE :Username Input
                    CustomFormField(
                      title: 'Username',
                      controller: usernameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //NOTE :fullname Input
                    CustomFormField(
                      title: 'Fullname',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //NOTE :Email Input
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //NOTE : PASSWORD INPUT
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    CustomFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthUpdateuser(
                          UserEditFormModel(
                            username: usernameController.text,
                            name:nameController.text,
                            email: emailController.text,
                            password: passwordController.text
                          )
                        ));
                      }
                        
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
