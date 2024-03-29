import 'package:flutter/material.dart';
import '../../../components/constants.dart';
import 'fade_slide_transition.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;

  const Header({super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const Logo(
          //   color: primaryDeepColor,
          //   size: 48.0,
          // ),
          const SizedBox(height: kSpaceM),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              'Welcome to Bubble',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: blackLightColor, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: kSpaceS),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              'Est ad dolor aute ex commodo tempor exercitation proident.',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: blackLightColor.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
