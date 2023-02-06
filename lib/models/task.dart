class Task {
  bool checked;
  String text;

  Task({
    required this.checked,
    required this.text,
  });

  void check() {
    checked = !checked;
  } 
}
