
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_project/common/helpers/is_dark_mode.dart';
import 'package:spotify_project/common/widgets/appbar/app_bar.dart';
import 'package:spotify_project/common/widgets/button/basic_app_button.dart';
import 'package:spotify_project/core/configs/assets/app_images.dart';
import 'package:spotify_project/core/configs/assets/app_vectors.dart';
import 'package:spotify_project/core/configs/theme/app_colors.dart';
import 'package:spotify_project/presentation/auth/pages/sign_in_page.dart';
import 'package:spotify_project/presentation/auth/pages/sign_up_page.dart';


class SigninSignup extends StatefulWidget {
  const SigninSignup({super.key});

  @override
  State<SigninSignup> createState() => _SignInState();
}

class _SignInState extends State<SigninSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
           child: Image.asset(AppImages.top_union_),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(AppImages.bottom_union),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.sign_in_backGR),
          ),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        AppVectors.logo),
                    const SizedBox(height: 55),
                    const Text('Enjoy Listening To Music',style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 21,),
                    const Text('Spotify is a proprietary Swedish audio streaming and media services provider ', textAlign: TextAlign.center,style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200, color: AppColors.grey,),),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 30
                      ),
                      child: Row(children: [
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(onPressed_: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
                            title: 'Register'),
                        ),
                        Expanded(
                            flex: 1,
                            child: TextButton(onPressed:  (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignInPage()));
                          }, child: Text('Sign in', style: TextStyle(fontSize: 19, color: context.isDarkMode ? Colors.white : Colors.black ),),

                          ),
                        ),
                                    ],
                      ),
                    ),


                  ],
                ),
            ),
          ),
        ],
      ),

    );
  }
}
