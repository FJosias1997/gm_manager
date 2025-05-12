import 'package:flutter/material.dart';
import 'package:gm_manager/database/database_provider.dart';
import 'package:gm_manager/extensions/context_extension.dart';
import 'package:gm_manager/pages/adicionar_relatorio_anual/relatorio_adicionado_sucesso_page.dart';
import 'package:gm_manager/pages/cadastrar_gm/cadastrar_gm_store.dart';
import 'package:gm_manager/widgets/button/default_button_widget.dart';
import 'package:gm_manager/widgets/text/default_form_title_subtitle_widget.dart';
import 'package:gm_manager/widgets/textfield/default_textfield_widget.dart';
import 'package:gm_manager/extensions/datetime_extension.dart';

class CadastrarGmPage extends StatefulWidget {
  const CadastrarGmPage({super.key});

  @override
  State<CadastrarGmPage> createState() {
    return _CadastrarGmPageState();
  }
}

class _CadastrarGmPageState extends State<CadastrarGmPage> {
  //Variáveis de Inicialização
  String nomepaciente = '';

  //Varáveis BD
  OfflineDatabaseProvider? database;
  CadastrarGmStore? store;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    database = OfflineDatabaseProvider();
    store = CadastrarGmStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar GM'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: store?.listaFormulario.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:
                    ((context, index) => Column(
                      children: [
                        DefaultFormTitleSubtitleWidget(
                          title: store!.listaFormulario[index]['title']!,
                          subtitle: store!.listaFormulario[index]['subtitle']!,
                        ),
                        DefaultTextFieldWidget(
                          controller: store?.listaControllers[index],
                          onTap: () {
                            if (index == 1) {
                              _selectDate(context);
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                      ],
                    )),
              ),
              const SizedBox(height: 15),
              DefaultButtonWidget(title: 'Salvar', onTap: saveRelatorio),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        store?.listaControllers[1].text = selectedDate.formatBRNoHour;
      });
    }
  }

  saveRelatorio() async {
    Map<String, dynamic> data = {
      'nome_gm': store!.listaControllers[0].text,
      'data_criacao': store!.listaControllers[1].text,
      'nome_lider': store!.listaControllers[2].text,
    };

    final result = await database!.saveGM(data: data);

    debugPrint(result.toString());

    if (result > 0) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const RelatorioAdicionadoSucessoPage(),
        ),
      );
    } else {
      if (!mounted) return;
      context.showSnackBar('Erro', context);
    }
  }
}
