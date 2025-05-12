import 'package:flutter/material.dart';
import 'package:gm_manager/extensions/context_extension.dart';
import 'package:gm_manager/services/share_relatorio_anual_pdf.dart';
import 'package:gm_manager/widgets/button/default_button_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

class RelatorioAdicionadoSucessoPage extends StatefulWidget {
  const RelatorioAdicionadoSucessoPage({super.key});

  @override
  State<RelatorioAdicionadoSucessoPage> createState() =>
      _RelatorioAdicionadoSucessoPageState();
}

class _RelatorioAdicionadoSucessoPageState
    extends State<RelatorioAdicionadoSucessoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Relatório Salvo com sucesso',
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset(
              'assets/success.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              repeat: false,
            ),
            const SizedBox(height: 12),
            DefaultButtonWidget(
              title: 'Exportar Como PDF',
              onTap: () {
                shareRelatorioAnual().then((value) async {
                  await SharePlus.instance.share(
                    ShareParams(
                      text: 'Great picture',
                      files: [XFile(value.path)],
                    ),
                  );
                });
              },
            ),
            const SizedBox(height: 12),
            DefaultButtonWidget(
              title: 'Voltar à Tela Inicial',
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
