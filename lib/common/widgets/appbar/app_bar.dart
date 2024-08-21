import 'package:flutter/material.dart';
import 'package:spotify_project/common/helpers/is_dark_mode.dart';
import 'package:spotify_project/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget ? title;
  const BasicAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text(''),
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
          shape: BoxShape.circle,

        ),
        child: Icon(Icons.arrow_back_ios_new_rounded, size: 15, color: context.isDarkMode ? Colors.white : Colors.black,
        ),

    ),
      ),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); //kToolbarHeight default value
}
