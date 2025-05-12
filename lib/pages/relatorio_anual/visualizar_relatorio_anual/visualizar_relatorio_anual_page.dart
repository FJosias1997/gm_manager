import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';
import 'package:gm_manager/models/relatorio_anual_model.dart';
import 'package:gm_manager/pages/relatorio_anual/visualizar_relatorio_anual/visualizar_relatorio_anual_controller.dart';
import 'package:gm_manager/widgets/button/default_button_widget.dart';
import 'package:gm_manager/widgets/text/default_form_title_subtitle_widget.dart';

class VisualizarRelatorioAnualPage extends StatefulWidget {
  final RelatorioAnualModel data;
  final String nomeGrupo;
  const VisualizarRelatorioAnualPage({
    required this.data,
    required this.nomeGrupo,
    super.key,
  });

  @override
  State<VisualizarRelatorioAnualPage> createState() =>
      _VisualizarRelatorioAnualPageState();
}

class _VisualizarRelatorioAnualPageState
    extends State<VisualizarRelatorioAnualPage> {
  late VisualizarRelatorioAnualController controller;

  @override
  void initState() {
    super.initState();
    controller = VisualizarRelatorioAnualController();
    _storeDataIntoController();
    _getRelatorio();
  }

  _storeDataIntoController() {
    controller.dataStored.value = widget.data;
  }

  _getRelatorio() {
    controller.generateMapData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relatório Anual')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: Column(
            children: [
              DefaultFormTitleSubtitleWidget(
                title: 'Grupo Missionário',
                subtitle: widget.nomeGrupo,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.itensData.length,
                itemBuilder:
                    (context, index) => DefaultFormTitleSubtitleWidget(
                      title:
                          controller.itensData.entries
                              .elementAt(index)
                              .key
                              .split('|')[0],
                      subtitle:
                          controller.itensData.entries
                              .elementAt(index)
                              .key
                              .split('|')[1],
                      trailing: Text(
                        '${controller.itensData.entries.elementAt(index).value}',
                        style: context.theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              ),
              const SizedBox(height: 12),
              DefaultButtonWidget(title: 'Exportar PDF', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
