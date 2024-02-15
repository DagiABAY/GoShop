import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessBuy extends StatefulWidget {
  const SuccessBuy({super.key});

  @override
  State<SuccessBuy> createState() => _SuccessBuyState();
}

class _SuccessBuyState extends State<SuccessBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    "assets/images/success.json",
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    "Successfully Buy!",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/products");
              },
              child: const Text("Back To Home"),
            ),
          ],
        ),
      ),
    );
  }
}
