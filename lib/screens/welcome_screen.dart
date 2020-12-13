import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import '../components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.grey ,end: Colors.white).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 300),
                  totalRepeatCount: 1,
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              text: 'Login',
              colour: Colors.lightBlueAccent,
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),

            RoundedButton(
                text: 'Register',
                colour: Colors.blueAccent,
                onPressed: (){
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}

