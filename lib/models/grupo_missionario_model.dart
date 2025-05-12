class GrupoMissionarioModel {
  int? id;
  String? nomeGM;
  String? dataCriacao;
  String? nomeLider;

  GrupoMissionarioModel({
    this.id,
    this.nomeGM,
    this.dataCriacao,
    this.nomeLider,
  });

  factory GrupoMissionarioModel.fromJson({
    required Map<String, dynamic> json,
    bool isFromWeb = false,
  }) {
    return GrupoMissionarioModel(
      id: json['id'],
      nomeGM: json['nome_gm'],
      dataCriacao: json['data_criacao'],
      nomeLider: json['nome_lider'],
    );
  }
}
