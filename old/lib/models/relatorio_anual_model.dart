class RelatorioAnualModel {
  int? id;
  int? nomeGmId;
  int? qntDecisoesCristo;
  int? qntDiscipuladosConcluidos;
  int? qntDiscipuladoresAtuantes;
  int? qntNovosConvertidos;
  int? qntTreinadosEdific;
  int? qntMultiplicacoesGm;
  int? qntPontuacaoGm;

  RelatorioAnualModel({
    this.id,
    this.nomeGmId,
    this.qntDecisoesCristo,
    this.qntDiscipuladoresAtuantes,
    this.qntDiscipuladosConcluidos,
    this.qntMultiplicacoesGm,
    this.qntNovosConvertidos,
    this.qntPontuacaoGm,
    this.qntTreinadosEdific,
  });

  factory RelatorioAnualModel.fromJson({
    required Map<String, dynamic> json,
    bool isFromWeb = false,
  }) {
    return RelatorioAnualModel(
      id: json['id'],
      nomeGmId: json['nome_gm_id'],
      qntDecisoesCristo: json['qnt_decisoes_cristo'],
      qntDiscipuladoresAtuantes: json['qnt_discipuladores_atuantes'],
      qntDiscipuladosConcluidos: json['qnt_discipulados_concluidos'],
      qntMultiplicacoesGm: json['qnt_multiplicacoes_gm'],
      qntNovosConvertidos: json['qnt_novos_convertidos'],
      qntPontuacaoGm: json['qnt_pontuacao_gm'],
      qntTreinadosEdific: json['qnt_treinados_edific'],
    );
  }
}
