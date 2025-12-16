import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

final class AppPreview extends Preview {
  const AppPreview({super.name = 'Screen Preview', super.group = 'App Screens'})
    : super(
        size: const Size(375, 812), // iPhone X size
        textScaleFactor: 1.0,
        theme: AppPreview.themeBuilder,
      );

  static PreviewThemeData themeBuilder() {
    return PreviewThemeData(
      materialLight: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.lightGreen[50],
      ),
      materialDark: ThemeData.dark(),
    );
  }
}

// final class SplashPreview extends Preview {
//   const SplashPreview({
//     super.name = 'Splash Screen',
//     super.group = ' Splash Screens',
//   }) : super(
//          size: const Size(375, 500),
//          textScaleFactor: 1.0,
//          theme: SplashPreview.themeBuilder,
//        );

//   static PreviewThemeData themeBuilder() {
//     return PreviewThemeData(
//       materialLight: ThemeData.light(),
//       materialDark: ThemeData.dark(),
//     );
//   }
// }

// final class AuthPreview extends Preview {
//   const AuthPreview({
//     super.name = 'Auth Screens',
//     super.group = 'Authentication',
//   }) : super(
//          size: const Size(375, 700),
//          textScaleFactor: 1.0,
//          theme: AuthPreview.themeBuilder,
//        );

//   static PreviewThemeData themeBuilder() {
//     return PreviewThemeData(
//       materialLight: ThemeData(primarySwatch: Colors.blue),
//       materialDark: ThemeData.dark(),
//     );
//   }
// }
