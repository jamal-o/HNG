import 'package:flutter/material.dart';
import 'package:stage_one/edit_page.dart';
import 'package:stage_one/slack_detail.dart';
import 'package:stage_one/web-view.dart';

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
              CircleAvatar(
                backgroundImage: AssetImage(displayPicturePath),
                radius: 75,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     // shape: BoxShape.circle,
              //     borderRadius: BorderRadius.circular(150),
              //   ),
              //   width: 150,
              //   height: 150,
              //   child: displayPicture,
              // ),
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
              EditButton(context),
              GitHubButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget slackDetailsSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Slack Display Name: ${slackDetails.fullName}',
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
          'Slack Display Name: ${slackDetails.gitHubHandle}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Slack Display Name: ${slackDetails.bio}',
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
    return IconButton(
      icon: Icon(Icons.edit),
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
  gitHubHandle: "@Jamal",
);
