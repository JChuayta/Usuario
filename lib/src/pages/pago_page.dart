import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';

class EfectuarPago extends StatefulWidget {
  @override
  _EfectuarPagoState createState() => _EfectuarPagoState();
}

class _EfectuarPagoState extends State<EfectuarPago> {
  String mes, anio;
  List anios = List.generate(20, ((int index) => "${index + 2000}"));
  int indextab = 0;

  List meses = [
    'Enero',
    'Febrero',
    'Marazo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Efectuar Pago"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Colors.blueAccent,
        child: Column(
          children: [
            imagenes(),
            nombreTitular(),
            numeroTarjeta(),
            mesAnio(),
            codigoSeguridad(),
            botonFinalizar(),
          ],
        ),
      ),
    );
  }

  Widget botonFinalizar() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 10.0),
          child: Text(
            'Finalizar Pago',
            style: TextStyle(color: Colors.white),
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 0.0,
        color: Colors.blueAccent,
        textColor: Colors.white,
        onPressed: () => _showDialog(context, false),
      ),
    );
  }

  void _showDialog(BuildContext context, bool error) {
    showAlert(
      context: context,
      // title: "Delete file?",
      body: (error)
          ? "Su Transaccion Tuvo Problemas, Por Favor Intente de Nuevo"
          : "Su transaccion se realizo correctamente!",
      actions: [
        AlertAction(
          text: "OK",
          isDestructiveAction: true,
          onPressed: () {
            (!error)
                ? Navigator.pushNamed(context, 'home')
                : print("ocurrio un erro");
          },
        ),
      ],
      // cancelable: true,
    );
  }

  Widget mesAnio() {
    return Container(
      // color: Colors.yellow[100],
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: DropdownButton(
              hint: Text("Mes"),
              elevation: 4,
              isExpanded: true,
              value: mes,
              items: meses.map((value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (value) {
                setState(() {
                  mes = value;
                });
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3,
            child: DropdownButton(
              hint: Text("Año"),
              elevation: 4,
              isExpanded: true,
              value: anio,
              items: anios.map((value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (value) {
                setState(() {
                  anio = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget codigoSeguridad() {
    return Container(
      // color: Colors.red[100],
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 15.0),
            height: MediaQuery.of(context).size.height * 0.07,
            child: Text("Codigo Seguridad", style: TextStyle(fontSize: 15.0)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imagenes() {
    return Container(
      // color: Colors.yellow[50],
      height: 100,
      padding: const EdgeInsets.only(top: 5.0),
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/tarjetas.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget nombreTitular() {
    return Container(
      // color: Colors.red[100],
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 15.0),
            height: MediaQuery.of(context).size.height * 0.07,
            child: Text("Nombre Titular", style: TextStyle(fontSize: 15.0)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget numeroTarjeta() {
    return Container(
      // color: Colors.green[100],
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20.0),
            height: MediaQuery.of(context).size.height * 0.07,
            child: Text("Numero Tarjeta", style: TextStyle(fontSize: 15.0)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
