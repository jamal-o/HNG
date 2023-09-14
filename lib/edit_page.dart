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
      bioController;
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // fullNameWidget(),
              Text("Full Name", style: labelText),
              // SizedBox(
              //   height: 3,
              // ),
              Expanded(
                child: TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
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
              Expanded(
                child: TextField(
                  controller: displayNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
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
              Expanded(
                child: TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              SizedBox(
                height: 6,
              ),

              // bioWidget(),
              Text("Display Name", style: labelText),
              SizedBox(
                height: 3,
              ),
              Expanded(
                child: TextField(
                  controller: bioController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),

              SizedBox(
                height: 6,
              ),

              updateButton(context),
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
