import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [
              AppPallete.gradient1,
              AppPallete.gradient2,
              //AppPallete.gradient3,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

        ),
        borderRadius : BorderRadius.circular(7),
      ),
      child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppPallete.transparentColor,//to show gradient without being hidden
            shadowColor: AppPallete.transparentColor,//to show gradient without being hidden
            fixedSize: const Size(395, 55),
          ),
          child: const Text('Sign Up', style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),),
      ),
    );

  }
}

