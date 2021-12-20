import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

// ignore: use_key_in_widget_constructors
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitChasingDots(
        size: 40,
        color: kPrimaryColor,
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class LoadingSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitChasingDots(
        size: 20,
        color: kPrimaryColor,
      ),
    );
  }
}
