class NoteItem {
  String text;
  bool isChecked;

  void isDone(){
    isChecked =! isChecked;
  }

  NoteItem({required this.text, this.isChecked = false});
}
