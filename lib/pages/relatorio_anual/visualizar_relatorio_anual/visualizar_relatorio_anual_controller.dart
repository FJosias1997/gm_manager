import 'package:flutter/material.dart';
import 'package:gm_manager/models/relatorio_anual_model.dart';

class VisualizarRelatorioAnualController {
  ValueNotifier<RelatorioAnualModel?> dataStored =
      ValueNotifier<RelatorioAnualModel?>(null);

  Map<String, dynamic> itensData = {};

  generateMapData() {
    itensData.addAll({
      'Decisões à Cristo|Nos GM e Encontrão':
          dataStored.value!.qntDecisoesCristo,
      'Discipulados Concluídos|Quantidade':
          dataStored.value!.qntDiscipuladosConcluidos,
      'Discipuladores Atuantes|Quantidade':
          dataStored.value!.qntDiscipuladoresAtuantes,
      'Novos Convertidos|Conduzidos ao Batismo':
          dataStored.value!.qntNovosConvertidos,
      'Treinados ao EDIFIC|Quantidade': dataStored.value!.qntTreinadosEdific,
      'Multiplicações no GM|Quantidade': dataStored.value!.qntMultiplicacoesGm,
      'Pontuação GM|Total': dataStored.value!.qntPontuacaoGm,
    });
  }
}
