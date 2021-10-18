import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/data/models/comics.dart';
import 'package:marvel_app/app/data/models/personagem.dart';
import 'package:marvel_app/app/pages/detail/detail_controller.dart';
import 'package:mobx/mobx.dart';

class DetailPage extends StatefulWidget {
  final Personagem personagem;

  const DetailPage({Key? key, required this.personagem}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailController>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));

  bool _expanded = false;

  double heigthListComics = 0;

  @override
  void initState() {
    controller.init(widget.personagem);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final future = controller.listaComics;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.8),
                      BlendMode.luminosity,
                    ),
                    image: NetworkImage(
                      widget.personagem.pathPhoto,
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(
                      top: 140.0,
                      left: 50,
                    ),
                    child: SizedBox(
                      width: 250,
                      height: 300,
                      child: Hero(
                        tag: widget.personagem.name,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          child: Image.network(
                            widget.personagem.pathPhoto,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(
                        left: 50, top: 20, right: 50, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.personagem.name,
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 30, color: Colors.white70),
                          ),
                        ),
                        Text(
                          widget.personagem.description.isEmpty
                              ? 'No descritpion '
                              : widget.personagem.description,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!_expanded) {
                        _animationController.forward();
                        setState(() {
                          heigthListComics = 280;
                        });
                      } else {
                        _animationController.reverse();
                        setState(() {
                          heigthListComics = 0;
                        });
                      }
                      _expanded = !_expanded;
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RotationTransition(
                            alignment: Alignment.center,
                            turns: Tween(begin: 0.0, end: 0.5)
                                .animate(_animationController),
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              size: 40,
                              color: Colors.black87,
                            ),
                          ),
                          const Text(
                            "Comics",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 22),
                          ),
                          RotationTransition(
                            alignment: Alignment.center,
                            turns: Tween(begin: 0.0, end: 0.5)
                                .animate(_animationController),
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              size: 40,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: heigthListComics,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    child: Observer(
                      builder: (_) {
                        switch (future.status) {
                          case FutureStatus.pending:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          case FutureStatus.rejected:
                            return const Center(
                              child: Text(
                                  "Não foi possível carregar os quadrinhos"),
                            );
                          case FutureStatus.fulfilled:
                            final List<Comic> listaComics = future.result;
                            if (listaComics.isEmpty) {
                              return const Center(
                                child: Text("Não foram encontrados quadrinhos"),
                              );
                            }

                            return _listOfComics(listaComics);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: 30,
              child: MaterialButton(
                onPressed: () => Modular.to.pop(),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                color: Colors.white12,
                height: 50,
                elevation: 10,
                shape: const CircleBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_listOfComics(List<Comic> comics) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: comics.length,
    itemBuilder: (context, index) {
      Comic comic = comics[index];

      return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: 120,
          height: 280,
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    comic.thumbnail,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    comic.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
