import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plant_care/services/auth_service.dart';
import 'package:svg_flutter/svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(top: 90),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color.fromARGB(0, 11, 138, 143),
              Color.fromARGB(255, 37, 170, 70),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome To',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SvgPicture.asset(
              'lib/assets/images/logo/PC.svg',
              height: 300,
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                height: 50,
                width: 230,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(6),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        surfaceTintColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      AuthService.signInWithGoogle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          'lib/assets/images/logo/android_light_rd_na.svg',
                          height: 28,
                        ),
                        Text(
                          'Continue With Google',
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      ],
                    )),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
