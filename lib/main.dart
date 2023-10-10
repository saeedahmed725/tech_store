import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_store/Feature/auth/view/screen/onboarding_screen.dart';
import 'package:tech_store/core/bloc/authentication/authentication_bloc.dart';

import 'core/bloc/simple_observer/simple_bloc_observer.dart';
import 'core/bloc/theme/theme_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const TechStore());
}

class TechStore extends StatelessWidget {
  const TechStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: const Locale('ar'),
              theme: state.themeData,
              //initialRoute: RouteGenerator.launcher,
              //onGenerateRoute: RouteGenerator.generateRoute,
              home: const OnBoardingScreen(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
