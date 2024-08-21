
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_project/common/widgets/appbar/app_bar.dart';
import 'package:spotify_project/common/widgets/button/basic_app_button.dart';
import 'package:spotify_project/common/widgets/text_field/text_field_all.dart';
import 'package:spotify_project/core/configs/assets/app_vectors.dart';
import 'package:spotify_project/data/models/auth/signin_user_req.dart';
import 'package:spotify_project/presentation/auth/pages/sign_up_page.dart';

import '../../../domain/usecases/auth/signin.dart';
import '../../../service_locator.dart';
import '../../root/pages/home_page.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController username_email_cont = TextEditingController();
  final TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SizedBox(
          width: 150,
            child: SvgPicture.asset(AppVectors.logo)),
      ),
      body: Center(
        child: Padding(
          padding:  const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 20,
          ),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Text('Sign In', style: TextStyle(fontSize: 30 ),),
              const SizedBox(height: 22),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('If You Need Any Support  '),
                  Text('Chick Here!',style: TextStyle(color: Colors.blue),),
                ],
              ),
              const SizedBox(height: 38),
              TextFieldAll(title: 'Enter Username Or Email', isObscure: false, icon: null, controller: username_email_cont ),
              const SizedBox(height: 16),
              TextFieldAll(title:'Password', isObscure: true, icon: Icons.hide_source , controller: password),
              const SizedBox(height: 17),
              const Align(
                alignment: Alignment.topLeft,
                  child: Text('Recovery Password',textAlign: TextAlign.left,)),
              const SizedBox(height: 22),
              BasicAppButton(
                  onPressed_:() async {
                    var result = await sl<SigninUseCase>().call(
                      params: SigninUserReq(
                          email: username_email_cont.text.toString(),
                          password: password.text.toString()),

                    );
                    result.fold(
                          (failure) {
                        var snack_bar = SnackBar(content: Text(failure),
                          behavior: SnackBarBehavior.floating,);
                        ScaffoldMessenger.of(context).showSnackBar(snack_bar);
                      },
                          (r) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const HomePage()),
                              (route) => false,
                        );
                      },);
                  }, title: 'Sign In',
    ),
            ],
          ),
        )
      ),
    );
  }
}
