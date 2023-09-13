class SlackDetails {
  final String fullName, userName, gitHubHandle;
  final String? bio;
  const SlackDetails(
      {required this.fullName,
      required this.userName,
      required this.gitHubHandle,
      this.bio = ""});
}
