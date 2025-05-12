import 'package:flutter/material.dart';

class DefaultDrawerMenuWidget extends StatelessWidget {
  const DefaultDrawerMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/menu.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
            child: Text('Pense Feridas',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ),
          ListTile(
            title: const Text('Conceitos e Classificações'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Complicações'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Avaliação de Feridas'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Atualizações'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Referências'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Sobre'),
            onTap: () {
              showAboutDialog(
                  context: context,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Text(
                        'Este aplicativo foi feito com o objetivo de gerar facilidades para os enfermeiros que atuam no cuidado com feridas cirúrgicas complexas.'),
                  ],
                  applicationIcon: const FlutterLogo(),
                  applicationName: 'Sobre o Pense Feridas',
                  applicationVersion: '1.0.0',
                  applicationLegalese: 'Desenvolvido por Josias Félix Studios');
            },
          ),
        ],
      ),
    );
  }
}
