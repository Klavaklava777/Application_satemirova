import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

// экраны
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/game_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = S.delegate.supportedLocales.first;

  void setLocale(Locale locale) async {
    await S.load(locale);
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: _locale,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(setLocale: setLocale),
        '/home': (context) => HomeScreen(setLocale: setLocale),
        '/catalog': (context) => const CatalogScreen(),
        '/game': (context) => const GameScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => SettingsScreen(setLocale: setLocale),
        '/payment': (context) => const PaymentScreen(),
        '/registration': (context) => RegistrationScreen(setLocale: setLocale),
      },
    );
  }
}
