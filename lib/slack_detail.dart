class SlackDetails {
  final String fullName, userName, displayName, gitHubHandle;
  final String? bio;
  const SlackDetails(
      {required this.fullName,
      required this.userName,
      this.displayName = '',
      required this.gitHubHandle,
      this.bio = ""});
}
