part of 'bottom_bar_cubit.dart';

final class BottomBarState extends Equatable {
  const BottomBarState({
    required this.menuItems,
    this.current = BottomMenu.home,
    this.isLockScreen = true,
  });

  final List<BottomBarItem> menuItems;
  final BottomMenu current;
  final bool isLockScreen;

  BottomBarState copyWith({
    List<BottomBarItem>? menuItems,
    BottomMenu? current,
    bool? isLockScreen,
  }) {
    return BottomBarState(
      menuItems: menuItems ?? this.menuItems,
      current: current ?? this.current,
      isLockScreen: isLockScreen ?? this.isLockScreen,
    );
  }

  @override
  List<Object> get props => [current, isLockScreen];
}
