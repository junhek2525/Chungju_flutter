import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple
            ),
            child: Text(
              '메뉴',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("홈"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/",(route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("홈"),
            onTap: () {
              Navigator.pushNamed(
                  context, "/setting");
            },
          )
        ],
      ),
    );
  }
}
