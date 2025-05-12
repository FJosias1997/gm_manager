import 'package:flutter/material.dart';
import 'package:gm_manager/database/database_provider.dart';
import 'package:gm_manager/models/grupo_missionario_model.dart';
import 'package:gm_manager/pages/adicionar_relatorio_anual/relatorio_adicionado_sucesso_page.dart';
import 'package:gm_manager/pages/adicionar_relatorio_anual/store/form_store.dart';
import 'package:gm_manager/widgets/button/default_button_widget.dart';
import 'package:gm_manager/widgets/text/default_form_title_subtitle_widget.dart';
import 'package:gm_manager/widgets/textfield/default_textfield_widget.dart';

class AdicionarRelatorioAnualPage extends StatefulWidget {
  const AdicionarRelatorioAnualPage({Key? key}) : super(key: key);

  @override
  State<AdicionarRelatorioAnualPage> createState() {
    return _AdicionarRelatorioAnualPageState();
  }
}

class _AdicionarRelatorioAnualPageState
    extends State<AdicionarRelatorioAnualPage> {
  //Variáveis de Inicialização
  String nomepaciente = '';

  //Varáveis BD
  OfflineDatabaseProvider? database;
  FormStore? store;

  List<GrupoMissionarioModel>? listaGrupos = [];
  GrupoMissionarioModel? dropdownValue;
  int? nomeGMId;

  @override
  void initState() {
    super.initState();

    database = OfflineDatabaseProvider();
    store = FormStore();
    _getGruposMissionarios();
  }

  _getGruposMissionarios() async {
    final lista = await database!.getListaGruposMissionarios();
    listaGrupos = lista;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório Anual'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: Column(
            children: [
              const DefaultFormTitleSubtitleWidget(
                title: 'Selecione o GM',
                subtitle: 'Para qual o relatório será criado',
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey),
                ),
                height: 60,
                width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.all(16),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<GrupoMissionarioModel>(
                      isExpanded: true,
                      hint: const Text('Nome GM'),
                      value: dropdownValue,
                      items: listaGrupos!
                          .map<DropdownMenuItem<GrupoMissionarioModel>>(
                              (value) {
                        return DropdownMenuItem<GrupoMissionarioModel>(
                          value: value,
                          child: Text(value.nomeGM!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          nomeGMId = value!.id!;
                          dropdownValue = value;
                        });
                      }),
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                itemCount: store?.listaFormulario.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) => Column(
                      children: [
                        DefaultFormTitleSubtitleWidget(
                          title: store!.listaFormulario[index]['title']!,
                          subtitle: store!.listaFormulario[index]['subtitle']!,
                          trailing: SizedBox(
                            width: 60,
                            child: DefaultTextFieldWidget(
                              type: TextInputType.number,
                              controller: store!.listaControllers[index],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              DefaultButtonWidget(
                title: 'Salvar relatório',
                onTap: saveRelatorio,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  saveRelatorio() async {
    Map<String, dynamic> data = {
      'nome_gm_id': nomeGMId,
      'qnt_decisoes_cristo': store!.listaControllers[0].text,
      'qnt_discipulados_concluidos': store!.listaControllers[1].text,
      'qnt_discipuladores_atuantes': store!.listaControllers[2].text,
      'qnt_novos_convertidos': store!.listaControllers[3].text,
      'qnt_treinados_edific': store!.listaControllers[4].text,
      'qnt_multiplicacoes_gm': store!.listaControllers[5].text,
      'qnt_pontuacao_gm': store!.listaControllers[6].text,
    };

    final result = await database!.saveRelatorioAnual(data: data);

    debugPrint(result.toString());

    if (result > 0) {
      if (!context.mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const RelatorioAdicionadoSucessoPage()));
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Erro')));
    }
  }
}
