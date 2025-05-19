import 'dart:math' as math show pi;

import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Mg Web App',
      home: Scaffold(
        body: SidebarPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text('Ya! Botón presionado!')),
            );
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ),
      ),
    );
  }
}

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String _headline;
  final AssetImage _avatarImg = AssetImage('assets/man.png');

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'DashBoard'),
        onHold:
            () => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: const Text("Dashboard"))),
        isSelected: true,
        subItems: [
          CollapsibleItem(
            text: 'Menu',
            icon: Icons.menu_book,
            onPressed: () => setState(() => _headline = 'Menu'),
            onHold:
                () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: const Text("Menu"))),
            isSelected: true,
          ),
          CollapsibleItem(
            text: 'Shop',
            iconImage: AssetImage("assets/shop_icon.png"),
            icon: Icons.ac_unit,
            onPressed: () => setState(() => _headline = 'Shop'),
            onHold:
                () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: const Text("Shop"))),
            isSelected: true,
            subItems: [
              CollapsibleItem(
                text: 'Carrito',
                icon: Icons.shopping_cart,
                onPressed: () => setState(() => _headline = 'Carrito'),
                onHold:
                    () => ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: const Text("Carrito"))),
                isSelected: true,
              ),
            ],
          ),
        ],
      ),

      CollapsibleItem(
        text: 'Empleados',

        icon: Icons.people,
        onPressed: () => setState(() => _headline = 'Empleados'),
        onHold:
            () => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: const Text("Empleados"))),
      ),

      CollapsibleItem(
        text: 'Configurar',
        icon: Icons.settings,
        onPressed: () => setState(() => _headline = 'Configurar'),
        onHold:
            () => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: const Text("Settings"))),
      ),
      CollapsibleItem(
        text: 'Ayuda',
        icon: Icons.help,
        onPressed: () => setState(() => _headline = 'Ayuda'),
        onHold:
            () => ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: const Text("Ayuda"))),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: CollapsibleSidebar(
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _items,
        collapseOnBodyTap: false,
        avatarImg: _avatarImg,
        title: 'MiguelGon',
        onTitleTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Miguel A Gonzalez D - 2025')));
        },
        body: _body(size, context),
        backgroundColor: const Color.fromARGB(255, 26, 25, 25),
        selectedTextColor: Colors.limeAccent,
        textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        titleStyle: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        sidebarBoxShadow: [
          BoxShadow(
            color: Colors.indigo,
            blurRadius: 20,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.green,
            blurRadius: 50,
            spreadRadius: 0.01,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(255, 205, 205, 206),
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              _headline,
              style: Theme.of(context).textTheme.displayLarge,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
