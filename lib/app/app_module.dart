import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/pages/detail/detail_controller.dart';
import 'package:marvel_app/app/pages/detail/detail_page.dart';
import 'package:marvel_app/app/pages/home/home_controller.dart';
import 'package:marvel_app/app/pages/home/home_page.dart';
import 'package:marvel_app/app/repositories/personagens_repository.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController()),
    Bind((i) => DetailController()),
    Bind((i) => PersonagensRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/detail/:personagem',
          child: (context, args) => DetailPage(
            personagem: args.data,
          ),
          transition: TransitionType.fadeIn
        ),
      ];
}
