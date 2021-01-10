import 'package:flutter/material.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:focus_app/src/models/prueba.dart';
import 'package:focus_app/src/pages/seleccion_page.dart';

class ListaWidget extends StatefulWidget {
  @override
  _ListaWidgetState createState() => _ListaWidgetState();
}

class _ListaWidgetState extends State<ListaWidget> {
  final controller = DragSelectGridViewController();

  List<Prueba> lista = [
    new Prueba(
        nombre: "goku",
        imagen:
            "https://i.pinimg.com/originals/21/6f/69/216f69f569a73717d54db552551ad43f.jpg"),
    new Prueba(
        nombre: "vegeta",
        imagen:
            "https://upload.wikimedia.org/wikipedia/commons/6/65/Prince_Vegeta.png"),
    new Prueba(
        nombre: "vegeta",
        imagen:
            "https://cr00.epimg.net/radio/imagenes/2020/02/26/entretenimiento/1582741709_730119_1582741931_noticia_normal.jpg"),
    new Prueba(
        nombre: "vegeta",
        imagen:
            "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2019/07/dragon-ball-blu-ray.png"),
    new Prueba(
        nombre: "vegeta",
        imagen:
            "https://i.blogs.es/3351e2/dragon-ball-fighterz_20190509011914/1366_2000.jpeg"),
    new Prueba(
        nombre: "vegeta",
        imagen:
            "https://www.cinemascomics.com/wp-content/uploads/2020/04/dragon-ball-z-disney-serie-live-action.jpg"),
    new Prueba(
        nombre: "vegeta",
        imagen:
            "https://upload.wikimedia.org/wikipedia/commons/6/65/Prince_Vegeta.png"),
  ];
  @override
  void initState() {
    super.initState();
    print(lista.length);
    controller.addListener(scheduleRebuild);
  }

  @override
  void dispose() {
    controller.removeListener(scheduleRebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: size.height * 0.73,
            child: DragSelectGridView(
              gridController: controller,
              padding: const EdgeInsets.all(5),
              itemCount: lista.length,
              itemBuilder: (context, index, selected) {
                return Container(
                  child: SelectableItem(
                    index: index,
                    cantidad: 7,
                    color: Colors.blue,
                    selected: selected,
                    lista: lista[index],
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            ),
          ),
          Container(
            child: (controller.value.isSelecting)
                ? RaisedButton(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 10.0),
                        child: Text(
                            '${controller.value.amount} fotos selccionados')),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    elevation: 0.0,
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () => {
                      // print(
                      //     controller.value.selectedIndexes.iterator.current)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeleccionPage(
                            selection: controller.value,
                            lista: lista,
                          ),
                        ),
                      )
                    },
                  )
                : null,
          ),
        ],
      ),
    );
  }

  void scheduleRebuild() => setState(() {});
}

class SelectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SelectionAppBar({
    Key key,
    this.title,
    this.selection = const Selection.empty(),
  })  : assert(selection != null),
        super(key: key);

  final Widget title;
  final Selection selection;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: selection.isSelecting
          ? AppBar(
              key: const Key('selecting'),
              titleSpacing: 0,
              leading: const CloseButton(),
              title: Text('${selection.amount} asientos selccionados'),
            )
          : AppBar(
              key: const Key('not-selecting'),
              title: title,
            ),
    );
  }
}

class SelectableItem extends StatefulWidget {
  const SelectableItem({
    Key key,
    @required this.index,
    @required this.cantidad, // era para ver cuantos no entrarian creo
    @required this.color,
    @required this.selected,
    @required this.lista,
  }) : super(key: key);

  final int index;
  final int cantidad;
  final MaterialColor color;
  final bool selected;
  final Prueba lista;

  @override
  _SelectableItemState createState() => _SelectableItemState();
}

class _SelectableItemState extends State<SelectableItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: widget.selected ? 1 : 0,
      duration: kThemeChangeDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void didUpdateWidget(SelectableItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selected != widget.selected) {
      if (widget.selected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Container(
            child: Transform.scale(
          scale: _scaleAnimation.value,
          child: DecoratedBox(
            child: child,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: (widget.selected) ? calculateColor() : Colors.white,
            ),
          ),
        ));
      },
      child: Container(
        alignment: Alignment.center,
        child: Image.network(widget.lista.imagen),
        // Image.asset(
        //   'assets/login.png',
        //   width: 80.0,
        //   height: 80.0,
        //   fit: BoxFit.fill,
        // ),
      ),
    );
  }

  Color calculateColor() {
    return Color.lerp(
      widget.color.shade500,
      widget.color.shade900,
      _controller.value,
    );
  }
}
