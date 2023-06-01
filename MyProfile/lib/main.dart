import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  launchURL(String url) async {
    if (!await launchURL(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 201, 0, 0),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.home)),
        title: Text(
          " MY PROFILE",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image(image: AssetImage("assets/ddey.png")),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () => Fluttertoast.showToast(
                      msg: 'Please Click on the links given below.',
                      fontSize: 18),
                  child: Text("About ME"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              Text("Hi! I am Debasish Dey.",
                  style: Theme.of(context).textTheme.headline4),
              Text(
                "B.tech Undergrad '26 at VSSUT, Burla.",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "I am an Anime Enthusiast.",
                style: Theme.of(context).textTheme.headline6,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ContactWidget(
                title: 'GitHub',
                icon: FontAwesomeIcons.github,
                onPress: () {
                  const url = "https://github.com/Debasish-Dey";
                  launchURL(url);
                },
              ),
              ContactWidget(
                title: 'LinkedIn',
                icon: FontAwesomeIcons.linkedin,
                onPress: () {
                  const url =
                      "https://www.linkedin.com/in/debasish-dey-58647226b/";
                  launchURL(url);
                },
              ),
              ContactWidget(
                title: 'Instagram',
                icon: FontAwesomeIcons.instagram,
                onPress: () {
                  const url = "https://www.instagram.com/dd_at_mercy/";
                  launchURL(url);
                },
              ),
              ContactWidget(
                title: 'Email',
                icon: FontAwesomeIcons.envelope,
                onPress: () {
                  const url = "mail@debasishdey.1512@gmail.com";
                  launchURL(url);
                },
              ),
              ContactWidget(
                title: 'Phone',
                icon: FontAwesomeIcons.phone,
                onPress: () => Fluttertoast.showToast(
                    msg: 'You\'ll be redirected to phone.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    // this.endIcon,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  // final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueGrey.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(
          FontAwesomeIcons.arrowRight,
          size: 18.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
