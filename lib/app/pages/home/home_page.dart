import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/data/models/personagem.dart';
import 'package:marvel_app/app/pages/home/home_controller.dart';
import 'package:mobx/mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.getPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final future = controller.listaPerson;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/marvel.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Image.asset('assets/marvel-logo.jpg'),
              ),
            ),
          ),
          Observer(builder: (_) {
            switch (future.status) {
              case FutureStatus.pending:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case FutureStatus.rejected:
                return const Center(
                  child: Text("Não foi possível carregar os personagens"),
                );

              case FutureStatus.fulfilled:
                final List<Personagem> listaPersonagens = future.result;
                return Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listaPersonagens.length + (controller.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if(index == listaPersonagens.length - controller.nextPageThreshold) {
                          controller.getPersons();
                        }
                        Personagem personagem = listaPersonagens[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: GestureDetector(
                                    onTap: () => Modular.to.pushNamed('/detail/',
                                        arguments: personagem),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Hero(
                                        tag: personagem.name,
                                        child: Image.network(
                                          personagem.pathPhoto,
                                          height: 250,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 45,
                                  alignment: Alignment.center,
                                  child: Text(
                                    personagem.name,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
            }
          })
        ],
      ),
    );
  }
}
