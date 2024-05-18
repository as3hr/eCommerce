import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:e_commerce/helpers/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final adaptiveTheme = AdaptiveTheme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ValueListenableBuilder(
            valueListenable: adaptiveTheme.modeChangeNotifier,
            builder: (context, theme, child) {
              return SizedBox(
                height: 0.06.sh,
                child: FlutterSwitch(
                  value: adaptiveTheme.mode.isDark,
                  padding: 4.0,
                  activeColor: AppColors.lightIndigo,
                  inactiveColor: AppColors.grayIII,
                  activeIcon: const Icon(
                    Icons.dark_mode,
                    color: AppColors.lightIndigo,
                  ),
                  inactiveIcon: const Icon(
                    Icons.light_mode,
                    color: AppColors.yellow,
                  ),
                  onToggle: (value) {
                    adaptiveTheme.setThemeMode(
                      value ? AdaptiveThemeMode.dark : AdaptiveThemeMode.light,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
