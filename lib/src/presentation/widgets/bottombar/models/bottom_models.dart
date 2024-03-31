enum BottomMenu {
  home,
  scan,
  profile,
}

class BottomBarItem {
  BottomMenu menu;
  String text;
  BottomBarItem(this.menu, this.text);
}
