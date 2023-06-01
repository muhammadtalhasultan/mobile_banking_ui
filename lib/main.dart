import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wallet_app/providers/date_provider.dart';
import 'package:wallet_app/utils/constants.dart';
import 'package:wallet_app/utils/pallete.dart';
import 'package:wallet_app/utils/routes.dart';
import 'package:provider/provider.dart';

import 'providers/confirm_password_provider.dart';
import 'providers/password_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Add this

  await FaceCamera.initialize(); //Add this
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PasswordProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ConfirmPasswordProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => DateProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Wallet App',
          theme: ThemeData(
            primarySwatch: Palette.primaryPaletteColor,
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: primaryColor,
              selectionColor: primaryColor,
              selectionHandleColor: primaryColor,
            ),
          ),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteGenerator.splashPage,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
