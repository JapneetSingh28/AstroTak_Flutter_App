import 'utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/services/ask_question_service.dart';
import 'data/services/relative_service.dart';
import 'logic/bloc/ask_question_bloc/ask_question_bloc.dart';
import 'logic/bloc/relative_bloc/relative_bloc.dart';
import 'views/screens/bottom_navigation_screen.dart';
import 'views/screens/profile_settings_screens/profile_settings_screen.dart';
import 'views/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AskQuestionBloc>(
          create: (context) => AskQuestionBloc(
            askQuestionService: AskQuestionService(),
          ),
        ),
        BlocProvider<RelativeBloc>(
          create: (context) => RelativeBloc(
            relativeService: RelativeService(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'AstroTak',
        initialRoute: SplashScreen.id,
        theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Colors.white,
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent,
          ),
        ),
        routes: {
          SplashScreen.id: (_) => const SplashScreen(),
          BottomNavigationScreen.id: (_) => const BottomNavigationScreen(),
          ProfileSettingsScreen.id: (_) => const ProfileSettingsScreen()
        },
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
