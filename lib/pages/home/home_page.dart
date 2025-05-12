import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';
import 'package:gm_manager/store/home_store.dart';
import 'package:gm_manager/widgets/drawer/default_drawer_menu_widget.dart';
import 'package:gm_manager/widgets/header/custom_home_header_widget.dart';
import 'package:gm_manager/widgets/itens/default_home_item_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final HomeStore store = HomeStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    key: key,
    drawer: const DefaultDrawerMenuWidget(),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHomeHeaderWidget(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cadastros',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 4,
                  children: List.generate(store.listaMenuItens.length, (index) {
                    return DefaultHomeItemCardWidget(
                      title: store.listaMenuItens[index].title!,
                      subtitle: store.listaMenuItens[index].subtitle!,
                      icon: store.listaMenuItens[index].icon!,
                      onTap: () {
                        debugPrint('object');
                        store.listaMenuItens[index].onTap!(context);
                      },
                    );
                  }),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Registros',
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 4,
                  children: List.generate(store.listaMenuItens2.length, (
                    index,
                  ) {
                    return DefaultHomeItemCardWidget(
                      title: store.listaMenuItens2[index].title!,
                      subtitle: store.listaMenuItens2[index].subtitle!,
                      icon: store.listaMenuItens2[index].icon!,
                      onTap: () {
                        debugPrint('object');
                        store.listaMenuItens2[index].onTap!(context);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
