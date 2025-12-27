import 'package:first_flutter_project/core/theme/app_pallete.dart';
import 'package:first_flutter_project/features/auth/presentation/widgets/auth_field.dart';
import 'package:first_flutter_project/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//Center vertically
            children: [
              const Text('Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),),

              const SizedBox(height: 30) ,//For spacing
              AuthField(hintText: 'Email',controller: emailController),
              const SizedBox(height: 15) ,//For spacing
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20) ,//For spacing

              const AuthGradientButton(),
              const SizedBox(height: 20) ,//For spacing
              RichText(
                  text: TextSpan(text: 'Don\'t have an account ?',
                      style : Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPallete.gradient2,
                          ),
                        )
                      ])
              ),



            ],
          ),
        ),
      ),
    );
  }
}
