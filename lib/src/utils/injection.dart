import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/utils/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)

Future<void> configureDependencies() async {
  $initGetIt(getIt);
}
