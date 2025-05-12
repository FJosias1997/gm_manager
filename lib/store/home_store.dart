import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';
import 'package:gm_manager/models/home_item_model.dart';
import 'package:gm_manager/pages/adicionar_relatorio_anual/adicionar_relatorio_anual_page.dart';
import 'package:gm_manager/pages/cadastrar_gm/cadastrar_gm_page.dart';
import 'package:gm_manager/pages/lista_grupos_missionarios/lista_grupos_missionarios_page.dart';
import 'package:gm_manager/pages/relatorio_anual/lista_relatorio_anual_page.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeStore {
  List<HomeItemModel> listaMenuItens = [
    HomeItemModel(
      title: 'Cadastrar GM',
      subtitle: 'Grupo Missionário',
      icon: PhosphorIcons.usersFour(),
      onTap: (context) {
        context.push(const CadastrarGmPage(), context);
      },
    ),
    HomeItemModel(
      title: 'Gerar Relatório\nAnual',
      subtitle: 'Um registro de todas as atividades no ano',
      icon: PhosphorIcons.listPlus(),
      onTap: (context) {
        debugPrint('aa');
        context.push(const AdicionarRelatorioAnualPage(), context);
      },
    ),
  ];

  List<HomeItemModel> listaMenuItens2 = [
    HomeItemModel(
      title: 'Visualizar\nRelatórios',
      subtitle: 'Um registro de todas as atividades no mês',
      icon: PhosphorIcons.fileText(),
      onTap: (context) {
        context.push(const ListaRelatorioAnualPage(), context);
      },
    ),
    HomeItemModel(
      title: 'Visualizar GMs',
      subtitle: 'Todos os grupos cadastrados',
      icon: PhosphorIcons.identificationCard(),
      onTap: (context) {
        context.push(const ListaGruposMissionariosPage(), context);
      },
    ),
  ];
}
