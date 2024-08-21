import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_project/core/configs/theme/app_theme.dart';
import 'package:spotify_project/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_project/presentation/pages/splash.dart';
import 'package:spotify_project/service_locator.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Widget tree starts.
  HydratedBloc.storage = await HydratedStorage.build( //It is created storage area.
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(), //Which storage area? -Mobile
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );// It is used to keep states permanently.
  await initializeDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( //it is used to generate blocs and cubits
        providers: [
      BlocProvider(create: (_) => ThemeCubit())
    ],
        child: BlocBuilder<ThemeCubit,ThemeMode>(
          builder: (context, mode) => MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home : const SplashPage(),
      ),
    ) );
  }
}
