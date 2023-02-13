class Task {
  int id;
  bool checked;
  String text;

  Task({
    required this.id,
    required this.checked,
    required this.text,
  });

  void check() {
    checked = !checked;
  } 
}
