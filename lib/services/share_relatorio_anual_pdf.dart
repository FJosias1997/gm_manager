import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

Future<File> shareRelatorioAnual() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        children: [
          pw.Text('Relatório Anual!'),
        ],
      ),
    ),
  );

  // Create a temporary directory within the app documents directory.
  final directory = await getTemporaryDirectory();

  // The name of the PDF document can be changed to user's choice.
  final file = File('${directory.path}/relatorio1.pdf');

  return await file.writeAsBytes(await pdf.save());
}
