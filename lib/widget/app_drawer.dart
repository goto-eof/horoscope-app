import 'package:flutter/material.dart';
import 'package:horoscope/screen/main_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerHeader(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.abc,
              size: 48,
            ),
            Text("Horoscope"),
            ListTile(
              leading: Icon(Icons.abc_outlined),
              title: Text("Segni"),
              onTap: () {
                // Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return MainScreen();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.abc_outlined),
              title: Text("Classifica del giorno"),
            ),
            ListTile(
              leading: Icon(Icons.abc_outlined),
              title: Text("Oroscopo dell'anno"),
            ),
            ListTile(
              leading: Icon(Icons.abc_outlined),
              title: Text("Biscotti della fortuna"),
            )
          ],
        ),
      ),
    );
  }
}
