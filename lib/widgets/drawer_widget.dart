import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("User Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            accountEmail: Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.blueAccent),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.blueAccent),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.category, color: Colors.green),
                  title: const Text("Categories"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading:
                      const Icon(Icons.shopping_cart, color: Colors.orange),
                  title: const Text("Cart"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading:
                      const Icon(Icons.account_circle, color: Colors.purple),
                  title: const Text("Profile"),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
