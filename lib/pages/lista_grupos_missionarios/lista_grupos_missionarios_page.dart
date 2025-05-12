import 'package:flutter/material.dart';
import 'package:gm_manager/models/relatorio_anual_model.dart';
import 'package:gm_manager/database/database_provider.dart';
import 'package:gm_manager/models/grupo_missionario_model.dart';
import 'package:gm_manager/pages/relatorio_anual/visualizar_relatorio_anual/visualizar_relatorio_anual_page.dart';
import 'package:gm_manager/widgets/drawer/default_drawer_menu_widget.dart';

class ListaGruposMissionariosPage extends StatefulWidget {
  const ListaGruposMissionariosPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaGruposMissionariosPageState();
  }
}

class ListaGruposMissionariosPageState
    extends State<ListaGruposMissionariosPage> {
  OfflineDatabaseProvider? database;
  List<GrupoMissionarioModel>? list;
  bool isLoading = false;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    database = OfflineDatabaseProvider();
    _getListaRelatoriosAnual();
    super.initState();
  }

  _getListaRelatoriosAnual() async {
    setState(() {
      isLoading = true;
    });

    final result = await database!.getListaGruposMissionarios();

    setState(() {
      list = result;
      isLoading = false;
    });
  }

  _deleteRelatorio(String id) async {
    setState(() {
      isLoading = true;
    });

    await database!.deleteRelatorioAnual(id);

    setState(() {
      isLoading = false;
    });

    _getListaRelatoriosAnual();
  }

  @override
  Widget build(BuildContext context) => PopScope(
    onPopInvoked: (value) async {
      debugPrint('Back Button Pressed');
    },
    child: Scaffold(
      key: key,
      appBar: AppBar(title: const Text('Grupos Missionários')),
      drawer: const DefaultDrawerMenuWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: Column(
            children: [
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : list == null || list!.isEmpty
                  ? const Center(child: Text('Sem dados'))
                  : ListView.builder(
                    shrinkWrap: true,
                    itemCount: list!.length,
                    itemBuilder: (_, index) {
                      return Card(
                        color: Colors.white,
                        elevation: 2.0,
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.yellow,
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                          title: Text('${list?[index].nomeGM}'),
                          subtitle: Text('Líder ${list?[index].nomeLider}'),
                          trailing: IconButton(
                            onPressed: () {
                              _deleteRelatorio(list![index].id!.toString());
                            },
                            icon: const Icon(Icons.delete, color: Colors.grey),
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
            ],
          ),
        ),
      ),

      /* floatingActionButton: DefaultSpeedDialWidget(
            widgets: [
              SpeedDialChild(
                child: Icon(Icons.report),
                backgroundColor: Colors.blue,
                label: 'Feridas Cirúrgicas',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () async {
                  final result =
                      await Navigator.of(context).pushNamed('/cirurgico_form');

                  if (result as int > 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Registro Criado com Sucesso.'),
                      ),
                    );
                    _getListaRelatoriosAnual();
                  }
                },
                onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
              ),
            ],
          ), */
    ),
  );
}
