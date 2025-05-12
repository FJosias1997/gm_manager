import 'package:flutter/material.dart';

class CadastrarGmStore {
  List<Map<String, String>> listaFormulario = [
    {
      'title': 'Nome do GM',
      'subtitle': 'Identificação',
    },
    {
      'title': 'Data de Criação',
      'subtitle': 'Ou o dia que começou a operar',
    },
    {
      'title': 'Nome do Líder',
      'subtitle': 'Líder do GM',
    },
  ];

  List<TextEditingController> listaControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
}
