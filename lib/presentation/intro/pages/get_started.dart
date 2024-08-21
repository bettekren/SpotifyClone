import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_project/common/widgets/button/basic_app_button.dart';
import 'package:spotify_project/core/configs/assets/app_images.dart';
import 'package:spotify_project/core/configs/assets/app_vectors.dart';
import 'package:spotify_project/core/configs/theme/app_colors.dart';
import 'package:spotify_project/presentation/choose_mode/pages/choose_mode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(AppImages.get_started_backGR),
              fit: BoxFit.cover,
            )),
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
                      const Text(
                        'Enjoy listening to music',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 68),
                      BasicAppButton(
                        onPressed_: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChooseMode())),
                        title: 'Get Started',
                      ),
                      const SizedBox(height: 69),
                      Container(
                        color: Colors.black.withOpacity(0.15),
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
