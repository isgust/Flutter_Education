import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_teste/settings_screen.dart';

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenha uma instância de MaterialLocalizations para acessar os textos localizados
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF447198), // Cor de fundo do AppBar
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            tooltip: localizations.openAppDrawerTooltip,
            onPressed: () {
              // Abre o Drawer ao clicar no ícone do menu
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          'Instagram',
        ),
        actions: [
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('First'),
                ),
                PopupMenuItem(
                  child: Text('Second'),
                ),
                PopupMenuItem(
                  child: Text('Third'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Home Tab',
        ),
      ),
      // Adiciona o Drawer ao Scaffold
      drawer: Drawer(
        child: ListView(
          // Defina os itens no Drawer
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  Text(
                      'Ana Lucia',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Ação ao selecionar "Home"
                Navigator.pop(context); // Fechar o Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Ação ao selecionar "Settings"
                Navigator.pop(context); // Fechar o Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Ação ao selecionar "About"
                Navigator.pop(context); // Fechar o Drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar Demo',
      localizationsDelegates: const [
        // Configurações para internacionalização com flutter_localizations
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        // Lista de idiomas suportados
        Locale('en', 'US'), // Inglês
        Locale('pt', 'BR'), // Português do Brasil
      ],
      home: const AppBarDemo(),
    );
  }
}
