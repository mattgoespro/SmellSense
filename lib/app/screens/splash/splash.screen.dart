import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smellsense/app/assets/generated/assets.gen.dart';
import 'package:smellsense/app/shared/widgets/animators/scale.animator.widget.dart';
import '../../shared/widgets/animators/fade.animator.widget.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with TickerProviderStateMixin {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    final List<Widget> introSequence = [
      ScaleAnimate(
        initialScale: 1,
        finalScale: 1.5,
        duration: const Duration(seconds: 5),
        child: FadeAnimate(
          onComplete: () {
            setState(() {
              _currentStep++;
            });
          },
          fadeInDuration: const Duration(seconds: 3),
          idleDuration: const Duration(milliseconds: 500),
          fadeOutDuration: const Duration(milliseconds: 800),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.branding.logo.image(
                width: 100,
                height: 100,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Smell",
                      style: theme.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "Sense",
                      style: theme.textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      FadeAnimate(
        onComplete: () {
          context.go("/scent-selection");
        },
        fadeInDuration: const Duration(milliseconds: 2000),
        idleDuration: const Duration(seconds: 2),
        fadeOutDuration: const Duration(milliseconds: 700),
        child: Center(
          heightFactor: 1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              "Let's start by selecting your training scents.",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Center(
        child: introSequence[_currentStep],
      ),
    );
  }
}
