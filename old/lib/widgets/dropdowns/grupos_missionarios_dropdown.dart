import 'package:flutter/material.dart';
import 'package:gm_manager/database/database_provider.dart';
import 'package:gm_manager/models/grupo_missionario_model.dart';

class GruposMissionariosDropdown extends StatefulWidget {
  final OfflineDatabaseProvider dbProvider;
  final Function(GrupoMissionarioModel?) onSelected;
  const GruposMissionariosDropdown(
      {required this.dbProvider, required this.onSelected, Key? key})
      : super(key: key);

  @override
  State<GruposMissionariosDropdown> createState() =>
      _GruposMissionariosDropdownState();
}

class _GruposMissionariosDropdownState
    extends State<GruposMissionariosDropdown> {
  List<GrupoMissionarioModel>? listaGrupos = [];
  GrupoMissionarioModel? dropdownValue;

  @override
  void initState() {
    super.initState();
    _getGruposMissionarios();
  }

  _getGruposMissionarios() async {
    final lista = await widget.dbProvider.getListaGruposMissionarios();
    listaGrupos = lista;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  .map<DropdownMenuItem<GrupoMissionarioModel>>((value) {
                return DropdownMenuItem<GrupoMissionarioModel>(
                  value: value,
                  child: Text(value.nomeGM!),
                );
              }).toList(),
              onChanged: (value) {
                dropdownValue = value;
                widget.onSelected(value);
              }),
        ));
  }
}
