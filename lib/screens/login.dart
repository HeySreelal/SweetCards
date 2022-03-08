import 'package:flutter/material.dart';
import 'package:sweetcards/services/auth.dart';

class SweetLogin extends StatefulWidget {
  const SweetLogin({Key? key}) : super(key: key);

  @override
  State<SweetLogin> createState() => _SweetLoginState();
}

class _SweetLoginState extends State<SweetLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "images/invitation.png",
              width: 150,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Sweet Cards',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: Text(
              'Keep track of your sweet memories, get started and enjoy!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => SweetAuth.signIn(),
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
