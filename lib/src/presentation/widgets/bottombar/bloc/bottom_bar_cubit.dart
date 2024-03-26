import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/presentation/widgets/bottombar/models/bottom_models.dart';

part 'bottom_bar_state.dart';

List<BottomBarItem> menuItems = [
  BottomBarItem(BottomMenu.home, 'รายการ'),
  BottomBarItem(BottomMenu.profile, 'โปรไฟล์'),
];

@Injectable()
class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarState(
          menuItems: menuItems,
          current: BottomMenu.home,
        ));

  @FactoryMethod()
  // final AuthenticationUseCase _repo;

  Future<void> loadMenuItems() async {
    var menuItems = state.menuItems;

    //final token = await AppStorage.shared.getToken();
    BottomMenu current = state.current;
    //if (token != null) {} else {}

    emit(state.copyWith(menuItems: menuItems, current: current));
  }

  Future<void> tabBarChanged(BottomMenu current) async {
    emit(state.copyWith(current: current));
  }

  Future<void> lockScreenChanged(bool isLockScreen) async {
    emit(state.copyWith(isLockScreen: isLockScreen));
  }

  Future<void> reset() async {
    emit(BottomBarState(menuItems: menuItems));
  }
}
