import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Colors.black.withOpacity(0.4),
      child: const Center(
        child: SizedBox(
          width: 70,
          height: 70,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff2EC790),
            ),
          ),
        ),
      ),
    );
  }

}