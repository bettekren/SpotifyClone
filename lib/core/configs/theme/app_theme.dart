import 'package:flutter/material.dart';
import 'package:spotify_project/core/configs/theme/app_colors.dart';

class AppTheme {
 static final lightTheme = ThemeData(

   primaryColor: AppColors.primary,
   scaffoldBackgroundColor: AppColors.lightBackground,
   brightness: Brightness.light,
   fontFamily: 'Roboto',
   elevatedButtonTheme: ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
       backgroundColor: AppColors.primary,
       textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(30),
       ),
     ),

   ),
 );

 static final darkTheme = ThemeData(
   primaryColor: AppColors.primary,
   scaffoldBackgroundColor: AppColors.darkBackground,
   brightness: Brightness.dark,
   fontFamily: 'Roboto',
   elevatedButtonTheme: ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
       backgroundColor: AppColors.primary,
       textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(30),
       ),
     ),
   ),
 );

}