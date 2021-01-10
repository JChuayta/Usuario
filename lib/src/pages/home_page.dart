import 'package:flutter/material.dart';
import 'package:focus_app/src/pages/lista_page.dart';
import 'package:focus_app/src/pages/login_page.dart';
import 'package:focus_app/src/pages/scanner_page.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ScreenHiddenDrawer> items = new List();

  @override
  void initState() {
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Scan QR",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.blue,
        ),
        ScanerPage()));
    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Perfil",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.orange,
        ),
        LoginPage()));

    items.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Lista Fotos",
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
          colorLineSelected: Colors.green,
        ),
        ListaWidget()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.grey[700],
      backgroundColorAppBar: Colors.grey[200],
      screens: items,
      //    typeOpen: TypeOpen.FROM_RIGHT,
      //    disableAppBarDefault: false,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      slidePercent: 70.0,
      //    verticalScalePercent: 80.0,
      contentCornerRadius: 20.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      //  backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      actionsAppBar: <Widget>[
        IconButton(
          onPressed: () => Navigator.pushNamed(context, 'login'),
          icon: Icon(Icons.exit_to_app),
        )
      ],
      // backgroundColorContent: Colors.blue,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      backgroundMenu: DecorationImage(
          image: NetworkImage(
              'https://heraldodemexico.com.mx/u/fotografias/m/2020/8/19/f638x638-249292_307459_5050.jpg'),
          fit: BoxFit.cover),
    );
  }
}
