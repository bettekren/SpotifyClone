import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_project/common/widgets/button/basic_app_button.dart';
import 'package:spotify_project/core/configs/assets/app_images.dart';
import 'package:spotify_project/core/configs/assets/app_vectors.dart';
import 'package:spotify_project/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_project/presentation/auth/pages/register_signin.dart';


class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.choose_mode_backGR),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Column(
            children: [
              SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(AppVectors.logo),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      const Text('Choose Mode', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                            },
                            child: ClipOval(
                              child: Container(
                                width:60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xff30393C).withOpacity(0.7),
                                ),
                                child: SizedBox(
                                    width: 10,
                                    child: SvgPicture.asset(AppVectors.choose_dark_vector,fit: BoxFit.none ,),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 71),
                          GestureDetector(
                            onTap: (){
                              context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                            },
                            child: ClipOval(
                              child: Container(
                                width:60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color(0xff30393C).withOpacity(0.7),
                                ),
                                child: SizedBox(
                                  width: 10,
                                  child: SvgPicture.asset(AppVectors.choose_light_vector,fit: BoxFit.none ,),
                                ),
                              ),
                            ),
                          ),
                            ],
                      ),
                      const SizedBox(height: 17,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dark Mode', style: TextStyle(color: Colors.white),),
                          SizedBox(width: 58),
                          Text('Light Mode', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 68),
                      BasicAppButton(onPressed_: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SigninSignup())),
                          title: 'Continue'),
                      const SizedBox(height: 69),
                      Container(
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
