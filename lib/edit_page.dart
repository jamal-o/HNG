import 'package:flutter/material.dart';
import 'package:stage_one/home_page.dart';
import 'package:stage_one/slack_detail.dart';

class EditPage extends StatefulWidget {
  SlackDetails slackdetails;

  EditPage({required this.slackdetails, super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late final TextEditingController fullNameController,
      displayNameController,
      userNameController,
      bioController;
  late SlackDetails slackdetails = widget.slackdetails;
  late SlackDetails updatedSlackDetails;

  String? fullName, displayName, userName, gitHubHandle, bio;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    fullNameController = TextEditingController();
    fullNameController.text = slackdetails.fullName;
    displayNameController = TextEditingController();
    userNameController = TextEditingController();
    bioController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullNameController.dispose();
    displayNameController.dispose();
    userNameController.dispose();
    bioController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 32,
                  child: Text("Full Name"),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 100,
                  height: 30,
                  child: TextField(
                    controller: fullNameController,
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  fullName = fullNameController.text;
                  displayName = displayNameController.text;

                  // userNameController.dispose();
                  // bioController.dispose();

                  updatedSlackDetails = SlackDetails(
                      fullName: fullName ?? '',
                      userName: userName ?? '',
                      gitHubHandle: gitHubHandle ?? '');

                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(slackDetails: updatedSlackDetails)),
                      (route) => false);
                },
                child: Text('Update details!')),
          ],
        ),
      ),
    );
  }
}
