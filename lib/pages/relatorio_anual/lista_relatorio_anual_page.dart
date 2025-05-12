import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';
import 'package:gm_manager/models/relatorio_anual_model.dart';
import 'package:gm_manager/database/database_provider.dart';
import 'package:gm_manager/pages/relatorio_anual/visualizar_relatorio_anual/visualizar_relatorio_anual_page.dart';
import 'package:gm_manager/widgets/appbar/default_appbar_widget.dart';
import 'package:gm_manager/widgets/drawer/default_drawer_menu_widget.dart';
import 'package:gm_manager/widgets/dropdowns/grupos_missionarios_dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ListaRelatorioAnualPage extends StatefulWidget {
  const ListaRelatorioAnualPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaRelatorioAnualPageState();
  }
}

class ListaRelatorioAnualPageState extends State<ListaRelatorioAnualPage> {
  OfflineDatabaseProvider? database;
  List<RelatorioAnualModel>? list;
  bool isLoading = false;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  List<String> listaNomeGrupos = [];
  //

  @override
  void initState() {
    super.initState();
    database = OfflineDatabaseProvider();
    _getListaRelatoriosAnual();
  }

  _getListaRelatoriosAnual({String? id}) async {
    setState(() {
      isLoading = true;
    });

    final result = await database!.getListaRelatorioAnual(gmId: id);

    for (var element in result) {
      final result = await database!.getGrupoMissionario(
        element.nomeGmId.toString(),
      );

      listaNomeGrupos.addAll([result.nomeGM!]);
    }

    setState(() {
      list = result;
      isLoading = false;
    });
  }

  _deleteRecord(String id) async {
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
  Widget build(BuildContext context) => Scaffold(
    key: key,
    appBar: defaultAppBar(context, 'Relatório Anual'),
    drawer: const DefaultDrawerMenuWidget(),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Column(
          children: [
            GruposMissionariosDropdown(
              dbProvider: database!,
              onSelected: (value) {
                if (listaNomeGrupos.isNotEmpty) {
                  listaNomeGrupos.clear();
                }
                _getListaRelatoriosAnual(id: value!.id.toString());
              },
            ),
            const SizedBox(height: 12),
            //
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
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            PhosphorIcons.file(),
                            color: context.theme.colorScheme.surface,
                          ),
                        ),
                        title: Text('Relatorio $index'),
                        subtitle: Text(listaNomeGrupos[index]),
                        trailing: IconButton(
                          onPressed: () {
                            _deleteRecord(list![index].id!.toString());
                          },
                          icon: const Icon(Icons.delete, color: Colors.grey),
                        ),
                        onTap: () {
                          context.push(
                            VisualizarRelatorioAnualPage(
                              data: list![index],
                              nomeGrupo: listaNomeGrupos[index],
                            ),
                            context,
                          );
                        },
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
  );
}
