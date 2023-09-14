import 'package:HNG_Demo/home_page.dart';
import 'package:HNG_Demo/slack_detail.dart';
import 'package:flutter/material.dart';

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
      bioController,
      gitHubHandleController;
  late SlackDetails slackdetails = widget.slackdetails;
  late SlackDetails updatedSlackDetails;

  String? fullName, displayName, userName, gitHubHandle, bio;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    fullNameController = TextEditingController();
    fullNameController.value = TextEditingValue(text: slackdetails.fullName);

    displayNameController = TextEditingController();
    displayNameController.value =
        TextEditingValue(text: slackdetails.displayName);

    userNameController = TextEditingController();
    userNameController.value = TextEditingValue(text: slackdetails.userName);

    bioController = TextEditingController();
    bioController.value = TextEditingValue(text: slackdetails.bio!);

    gitHubHandleController = TextEditingController();
    gitHubHandleController.value =
        TextEditingValue(text: slackdetails.gitHubHandle);
  }

  TextStyle labelText = const TextStyle(fontWeight: FontWeight.bold);

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // fullNameWidget(),
                    Text("Full Name", style: labelText),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 6,
                    ),

                    // displayNameWidget(),
                    Text("Display Name", style: labelText),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: displayNameController,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),

                    SizedBox(
                      height: 6,
                    ),
                    // userNameWidget(),
                    Text("User Name", style: labelText),
                    SizedBox(
                      height: 3,
                    ),

                    TextField(
                      controller: userNameController,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),

                    SizedBox(
                      height: 6,
                    ),

                    Text("GitHubHandle", style: labelText),
                    SizedBox(
                      height: 3,
                    ),

                    TextField(
                      controller: gitHubHandleController,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),

                    SizedBox(
                      height: 6,
                    ),
                    // bioWidget(),
                    Text("Bio", style: labelText),
                    SizedBox(
                      height: 3,
                    ),
                    TextField(
                      controller: bioController,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),

                    SizedBox(
                      height: 6,
                    ),

                    updateButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget updateButton(BuildContext context) {
    return Align(
      child: ElevatedButton(
        onPressed: () {
          fullName = fullNameController.text;
          displayName = displayNameController.text;
          bio = bioController.text;
          userName = userNameController.text;
          gitHubHandle = gitHubHandleController.text;

          // userNameController.dispose();
          // bioController.dispose();

          updatedSlackDetails = SlackDetails(
              fullName: fullName ?? '',
              bio: bio ?? '',
              displayName: displayName ?? '',
              userName: userName ?? '',
              gitHubHandle: gitHubHandle ?? '');

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                      HomePage(slackDetails: updatedSlackDetails)),
              (route) => false);
        },
        child: Text('Update details!'),
      ),
    );
  }

  Widget fullNameWidget() {
    return Row(
      children: [
        SizedBox(
          height: 32,
          child: Text("Full Name"),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: fullNameController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }

  Widget userNameWidget() {
    return Row(
      children: [
        SizedBox(
          height: 32,
          child: Text("User Name"),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: userNameController,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }

  Widget bioWidget() {
    return Row(
      children: [
        SizedBox(
          height: 32,
          child: Text("Bio"),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: bioController,
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }
}
