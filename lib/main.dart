import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_application/screens/login_screen.dart';
import 'package:travel_application/screens/main_screen.dart';
import 'package:travel_application/screens/onbording_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // 1. Flutter Engine එක සූදානම් කිරීම
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Environment Variables Load කිරීම
  try {
    await dotenv.load(fileName: ".env");
    print("✅ Env file loaded successfully!");
  } catch (e) {
    print("❌ Error loading .env file: $e");
    // .env නැතිව ඉදිරියට යාමෙන් පලක් නැති නිසා මෙතනින් නතර කළ හැක
    return;
  }

  // 3. Supabase Initialize කිරීම (Keys තියෙනවාදැයි පරීක්ෂා කරමු)
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  if (supabaseUrl == null || supabaseAnonKey == null) {
    print("❌ Supabase keys are missing in .env file!");
    return;
  }

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  print("✅ Supabase initialized!");

  // 4. App එක Start කිරීම
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/home': (context) => const MainScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
