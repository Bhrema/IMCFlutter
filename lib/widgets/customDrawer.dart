import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/lista_de_medicoes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                context: context,
                builder: (BuildContext bc) {
                  return Wrap(
                    children: [
                      ListTile(
                        title: const Text("Camera"),
                        leading: const Icon(Icons.camera),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: const Text("Galeria"),
                        leading: const Icon(Icons.album),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                  "https://avatars.githubusercontent.com/u/70335916?v=4",
                ),
              ),
              accountName: const Text("Bruno Crema"),
              accountEmail: const Text("brunohcrema@gmail.com"),
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 5),
                  Text("Ultimas medidas"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListaDeMedicoes(),
                ),
              );
            },
          ),
          const Divider(),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.album),
                    SizedBox(width: 5),
                    Text("Configurações"),
                  ],
                ),
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
