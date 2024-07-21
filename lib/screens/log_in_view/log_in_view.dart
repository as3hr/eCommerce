import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce_admin_panel/helpers/functions/loading_wrapper.dart';
import 'package:ecommerce_admin_panel/helpers/styles/app_decoration.dart';
import 'package:ecommerce_admin_panel/helpers/widgets/input_field.dart';
import 'package:ecommerce_admin_panel/screens/log_in_view/log_in_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../helpers/styles/app_colors.dart';

class LoginView extends StatelessWidget {
  static const routeName = '/';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              const AnimatedBackground(),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  width: 0.4.sw,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 50,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 25.0,
                            color: AppColors.skyBlue,
                            fontWeight: FontWeight.bold,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'C L O T   A D M I N   P A N E L',
                                textStyle: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                colors: [
                                  AppColors.skyBlue,
                                  Colors.blue,
                                  Colors.green,
                                  Colors.purple,
                                  Colors.pink,
                                ],
                              ),
                            ],
                            isRepeatingAnimation: true,
                            repeatForever: true,
                            onTap: () {},
                          ),
                        ),
                      ),
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Welcome Back!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: AppColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Please sign in to continue',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            InputField(
                              width: 0.3.sw,
                              onChanged: (val) {
                                controller.emailController.text = val;
                              },
                              onSubmit: (_) {
                                loadingWrapper(() async {
                                  await controller.submit(context);
                                }, context);
                              },
                              hintText: 'Email',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            InputField(
                              width: 0.3.sw,
                              onChanged: (val) {
                                controller.passwordController.text = val;
                              },
                              onSubmit: (_) {
                                loadingWrapper(() async {
                                  await controller.submit(context);
                                }, context);
                              },
                              hintText: 'Password',
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              passwordField: true,
                            ),
                            const SizedBox(height: 30),
                            InkWell(
                              onTap: () {
                                loadingWrapper(() async {
                                  await controller.submit(context);
                                }, context);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                                width: 0.3.sw,
                                height: 0.07.sh,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [AppColors.skyBlue, Colors.blue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.5),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: AppDecoration.boldStyle(
                                      fontSize: 20,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<LinearGradient> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _animation = LinearGradientTween(
      begin: const LinearGradient(
        colors: [AppColors.navy, AppColors.black],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      end: const LinearGradient(
        colors: [AppColors.navy, AppColors.navy],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: _animation.value,
          ),
        );
      },
    );
  }
}

class LinearGradientTween extends Tween<LinearGradient> {
  LinearGradientTween({LinearGradient? begin, LinearGradient? end})
      : super(begin: begin, end: end);

  @override
  LinearGradient lerp(double t) {
    return LinearGradient(
      colors: List<Color>.generate(
        begin!.colors.length,
        (index) => Color.lerp(begin!.colors[index], end!.colors[index], t)!,
      ),
      begin: Alignment.lerp(
        begin!.begin as Alignment,
        end!.begin as Alignment,
        t,
      )!,
      end: Alignment.lerp(
        begin!.end as Alignment,
        end!.end as Alignment,
        t,
      )!,
    );
  }
}
