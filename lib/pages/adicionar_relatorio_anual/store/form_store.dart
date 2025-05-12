import 'package:flutter/material.dart';

class FormStore {
  List<Map<String, String>> listaFormulario = [
    {
      'title': 'Decisões à Cristo',
      'subtitle': 'Nos GM e Encontrão',
    },
    {
      'title': 'Discipulados Concluídos',
      'subtitle': 'Quantidade',
    },
    {
      'title': 'Disipuladores Atuantes',
      'subtitle': 'Quantidade',
    },
    {
      'title': 'Novos Convertidos',
      'subtitle': 'Conduzidos ao Batismo',
    },
    {
      'title': 'Treinados no EDIFIC',
      'subtitle': 'Quantidade',
    },
    {
      'title': 'Multiplicações no GM',
      'subtitle': 'Quantidade',
    },
    {
      'title': 'Pontuação GM',
      'subtitle': 'Total',
    },
  ];

  List<TextEditingController> listaControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
}
