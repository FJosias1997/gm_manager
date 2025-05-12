import 'package:flutter/material.dart';
import 'package:gm_manager/models/grupo_missionario_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/relatorio_anual_model.dart';

class OfflineDatabaseProvider {
  static Database? _database;

  OfflineDatabaseProvider() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    // if _database is null we instantiate it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'gmmanager.db'),
      onCreate: createDatabase,
      version: 1,
    );
  }

  Future<void> createDatabase(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE grupos_missionarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome_gm VARCHAR,
        data_criacao VARCHAR,
        nome_lider VARCHAR
        )      
        ''',
    );
    await db.execute(
      '''
        CREATE TABLE relatorio_anual (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome_gm_id INTEGER,
        qnt_decisoes_cristo INTEGER,
        qnt_discipulados_concluidos INTEGER,
        qnt_discipuladores_atuantes INTEGER,
        qnt_novos_convertidos INTEGER,
        qnt_treinados_edific INTEGER,
        qnt_multiplicacoes_gm INTEGER,
        qnt_pontuacao_gm INTEGER,
        FOREIGN KEY(nome_gm_id) REFERENCES grupos_missionarios(id)
        )      
        ''',
    );
  }

  Future<List<RelatorioAnualModel>> getListaRelatorioAnual(
      {String? gmId}) async {
    final db = await database;

    try {
      final List<RelatorioAnualModel> listaRelatorios = [];

      final List<Map<String, dynamic>> list;

      if (gmId != null) {
        list = await db.query('relatorio_anual', where: 'nome_gm_id = $gmId');
      } else {
        list = await db.query('relatorio_anual');
      }

      for (var element in list) {
        listaRelatorios.add(RelatorioAnualModel.fromJson(json: element));
      }

      return listaRelatorios;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<GrupoMissionarioModel> getGrupoMissionario(String id) async {
    final db = await database;

    try {
      final List<GrupoMissionarioModel> listaGrupos = [];

      final List<Map<String, dynamic>> list =
          await db.query('grupos_missionarios', where: 'id=$id');

      for (var element in list) {
        listaGrupos.add(GrupoMissionarioModel.fromJson(json: element));
      }

      return listaGrupos.first;
    } catch (e) {
      debugPrint(e.toString());
      return GrupoMissionarioModel();
    }
  }

  Future<List<GrupoMissionarioModel>> getListaGruposMissionarios() async {
    final db = await database;

    try {
      final List<GrupoMissionarioModel> listaGrupos = [];

      final List<Map<String, dynamic>> list =
          await db.query('grupos_missionarios');

      for (var element in list) {
        listaGrupos.add(GrupoMissionarioModel.fromJson(json: element));
      }

      return listaGrupos;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<int> saveRelatorioAnual({
    required Map<String, dynamic> data,
  }) async {
    final db = await database;

    try {
      return await db.insert('relatorio_anual', data);
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  Future<int> saveGM({
    required Map<String, dynamic> data,
  }) async {
    final db = await database;

    try {
      return await db.insert('grupos_missionarios', data);
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }

  Future<int> deleteRelatorioAnual(String id) async {
    final db = await database;

    try {
      return await db
          .rawDelete('DELETE FROM relatorio_anual WHERE id = ?', [id]);
    } catch (e) {
      debugPrint(e.toString());
      return 0;
    }
  }
}
