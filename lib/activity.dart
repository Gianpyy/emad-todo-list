class Activity {
  String title;
  bool done;
  bool important;

  Activity({
    required this.title,
    this.done = false,
    this.important = false,
  });
}