import 'package:flutter/material.dart';
import 'package:stage_one/web-view.dart';

class HomePage extends StatelessWidget {
  HomePage({required pageTitle, super.key});

  //TODO: Make it update with changes
  SlackDetail slackDetail = SlackDetail(
    fullName: "Olasupo Jamaldeen Abimbola",
    userName: "Jamal",
    gitHubHandle: "@Jamal",
  );

  // Scaffold scaffold = Scaffold(
  //   appBar: appBar,
  //   body: Container(
  //     alignment: Alignment.center,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             borderRadius: BorderRadius.circular(150),
  //           ),
  //           width: 150,
  //           height: 150,
  //           child: displayPicture,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: slackDetailsSection,
  //         ),
  //         const SizedBox(
  //           height: 30,
  //         ),
  //         GitHubButton(context),
  //       ],
  //     ),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    //TODO: retrieve slack details and cv details

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        // alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(150),
              ),
              width: 150,
              height: 150,
              child: displayPicture,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: slackDetailsSection(),
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

  Widget slackDetailsSection() {
    return Column(
      children: [
        Text(
          'Slack Display Name: ${slackDetail.fullName}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Slack User Name: ${slackDetail.userName}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Slack Display Name: ${slackDetail.gitHubHandle}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Slack Display Name: ${slackDetail.bio}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget displayPicture = Image.asset('images/picture.jpg');

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

class SlackDetail {
  String fullName, userName, gitHubHandle;
  String? bio;
  SlackDetail(
      {required this.fullName,
      required this.userName,
      required this.gitHubHandle,
      this.bio = ""});
}
