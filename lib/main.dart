import 'package:flutter/material.dart';
import 'package:stage_one/web-view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(
          pageTitle: 'Stage One Task',
        ));
  }
}

class HomePage extends StatelessWidget {
  HomePage({required pageTitle, super.key});

  // late final String pageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: DisplayPicture,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SlackName,
            ),
            const SizedBox(
              height: 30,
            ),
            GitHubButton(context),
          ],
        ),
      ),
    );
  }

  Widget SlackName = Text(
    'Slack Display Name: Jamal',
    style: TextStyle(
      fontSize: 18,
    ),
  );
  Widget DisplayPicture = Image.asset('images/picture.jpg');

  Widget GitHubButton(context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => GitHubWebView()),
          ),
        );
      },
      child: Text("Open GitHub!"),
    );
  }
}

AppBar appBar = AppBar(
  title: Center(
    child: Text("Stage One"),
  ),
);
