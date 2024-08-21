
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_project/data/models/auth/create_user_req.dart';
import 'package:spotify_project/domain/usecases/auth/signup.dart';
import 'package:spotify_project/presentation/auth/pages/sign_in_page.dart';
import 'package:spotify_project/presentation/root/pages/home_page.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../common/widgets/text_field/text_field_all.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController fullname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screen_size = MediaQuery.of(context);
    final double size_width = screen_size.size.width;
    final double size_height = screen_size.size.height;
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.logo, width: 150,),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: MediaQuery.of(context).size.height,
    ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  _registerTexts(text: 'Register',  fontSize: 30),
                  const SizedBox(height: 22),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('If You Need Any Support '),
                      Text('Chick Here!', style: TextStyle(color: AppColors.primary),),
                    ],
                  ),

                  const SizedBox(height: 50),
                  TextFieldAll(title: 'Full Name', isObscure: false, icon: null, controller: fullname),
                  const SizedBox(height:16),
                  TextFieldAll(title: 'Enter Email', isObscure: false, icon: null, controller: email),
                  const SizedBox(height: 16),
                  TextFieldAll(title: 'Password', isObscure: true, icon: Icons.hide_source , controller: password),
                  const SizedBox(height: 22),
                  BasicAppButton( onPressed_: () async {
                    var result = await sl<SignupUseCase>().call(
                      params: CreateUserReq(
                          fullName: fullname.text.toString(),
                          email: email.text.toString(),
                          password: password.text.toString()),
                    );
                    result.fold(
                            (failure) {
                            var snackBar = SnackBar(content: Text(failure), behavior: SnackBarBehavior.floating,);
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                            (r) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context) => SignInPage()),
                                      (route) => false,
                              );

                            },
                    );


                  }, title: 'Create Account'),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _registerTexts(text: 'Do you have an account? ', fontSize: 14),
                      TextButton(onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignInPage()));
                      } , child: const Text('Sign in', style: TextStyle(color: Colors.blue),))
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _registerTexts({required String text, required double fontSize}){
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  }






