import 'package:flutter/material.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:focus_app/src/models/prueba.dart';

class SeleccionPage extends StatefulWidget {
  const SeleccionPage({
    Key key,
    @required this.selection,
    @required this.lista,
  }) : super(key: key);

  final Selection selection;
  final List<Prueba> lista;

  @override
  _SeleccionPageState createState() => _SeleccionPageState();
}

class _SeleccionPageState extends State<SeleccionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Fotografias"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            child: Expanded(
              child: ListView.builder(
                  itemCount: widget.selection.amount,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Center(
                                child: Text(
                                  "Foto #${widget.selection.selectedIndexes.elementAt(index)}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                              ),
                            ),
                            Container(
                              height: 250,
                              alignment: Alignment.center,
                              child: Image.network(widget
                                  .lista[widget.selection.selectedIndexes
                                      .elementAt(index)]
                                  .imagen),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Container(
              child: RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 10.0),
              child: Text(
                'Pagar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 0.0,
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () => {Navigator.pushNamed(context, 'pago')},
          ))
        ],
      ),
    );
  }
}
