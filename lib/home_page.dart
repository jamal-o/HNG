import 'package:HNG_Demo/edit_page.dart';
import 'package:HNG_Demo/slack_detail.dart';
import 'package:HNG_Demo/web-view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({this.slackDetails = defaultSlackDetails, super.key});

  //TODO: Make it update with changes

  late final SlackDetails slackDetails;

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                  child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(displayPicturePath),
                      radius: 75,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: slackDetailsSection(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditButton(context),
                  SizedBox(width: 30),
                  GitHubButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slackDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Slack Full Name: ${slackDetails.fullName}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Slack User Name: ${slackDetails.userName}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Slack Display Name: ${slackDetails.displayName}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'GitHub Handle: ${slackDetails.gitHubHandle}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Bio: ${slackDetails.bio}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Image displayPicture = Image.asset(displayPicturePath);

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

  Widget EditButton(context) {
    return ElevatedButton(
      child: Icon(
        Icons.edit,
        //color: Colors.blue,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => EditPage(
                  slackdetails: slackDetails,
                )),
          ),
        );
      },
    );
  }
}

AppBar appBar = AppBar(
  title: const Center(
    child: Text("Profile"),
  ),
);

const String displayPicturePath = 'images/picture.jpg';

const defaultSlackDetails = SlackDetails(
    fullName: "Olasupo Jamaldeen Abimbola",
    userName: "Jamal",
    displayName: 'Jamal',
    gitHubHandle: "@Jamal",
    bio: 'hello I ');
