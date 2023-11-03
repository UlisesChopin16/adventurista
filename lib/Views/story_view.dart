import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';


class StoryViewP extends StatefulWidget {
  final int index;
  const StoryViewP({ 
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _StoryViewPState createState() => _StoryViewPState();
}

class _StoryViewPState extends State<StoryViewP> {

  final StoryController controller = StoryController();

  late PageController pageController = PageController(
    initialPage: widget.index,
    keepPage: true,

  );

  // arreglo de enteros para saber que historias se han visto
  List<int> listaHistoriasVistas = [];

  // arreglo de arreglos de historias
  late List<List<StoryItem?>> listaHistorias = [
    [
      StoryItem.text(
        title: 'Hello world!',
        backgroundColor: const Color.fromRGBO(158, 158, 158, 1),
      ),
      StoryItem.pageImage(
        url: 'https://picsum.photos/seed/picsum/200/300',
        caption: 'Still cute tho',
        imageFit: BoxFit.contain,
        controller: controller,
      ),
    ],
    [
      StoryItem.text(
        title: 'Hello world!',
        backgroundColor: Colors.redAccent,
      ),
      StoryItem.pageImage(
        url: 'https://img.freepik.com/foto-gratis/pintura-digital-montana-arbol-colorido-primer-plano_1340-25699.jpg?size=626&ext=jpg&ga=GA1.1.1016474677.1697328000&semt=ais',
        imageFit: BoxFit.contain,
        caption: 'Still cute tho',
        controller: controller,
      ),
    ],
    [
      StoryItem.text(
        title: 'Hello world!',
        backgroundColor: Colors.lightBlueAccent,
      ),
      StoryItem.pageImage(
        url: 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
        imageFit: BoxFit.contain,
        caption: 'Still cute tho',
        controller: controller,
      ),
    ],
    [
      StoryItem.text(
        title: 'Hello world!',
        backgroundColor: Colors.greenAccent,
      ),
      StoryItem.pageImage(
        url: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        imageFit: BoxFit.contain,
        caption: 'Still cute tho',
        controller: controller,
      ),
    ],
    [
      StoryItem.text(
        title: 'Hello world!',
        backgroundColor: Colors.purpleAccent,
      ),
      StoryItem.pageImage(
        url: 'https://picsum.photos/seed/picsum/200/300',
        imageFit: BoxFit.contain,
        caption: 'Still cute tho',
        controller: controller,
      ),
    ],
  ];
  
  @override
  void initState() {
    super.initState();
    // como saber cuando se hace scroll en el pageview
    listaHistoriasVistas.add(widget.index);

    pageController.addListener(() {
      if (!listaHistoriasVistas.contains(pageController.page!.toInt())) {
        listaHistoriasVistas.add(pageController.page!.toInt());
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(listaHistoriasVistas);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: listaHistorias.length,
              itemBuilder: (context, index) {
                return StoryView(
                  storyItems: listaHistorias[index],
                  onComplete: () {
                    // verificar que no se repita el index
                    if (!listaHistoriasVistas.contains(index)) {
                      listaHistoriasVistas.add(index);
                    }

                    // pasar a la siguiente historia
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 100), 
                      curve: Curves.easeIn
                    );                
                    
                    // si es la ultima historia se regresa a la pantalla anterior
                    if (index == listaHistorias.length - 1) {
                      Navigator.of(context).pop(listaHistoriasVistas);
                    }
                  },
                  onVerticalSwipeComplete: (direction) {
                    // print("Direction: $direction");
                    if (direction == Direction.down) {
                      Navigator.of(context).pop(listaHistoriasVistas);
                    } else if (direction == Direction.up) {
                      Navigator.of(context).pop(listaHistoriasVistas);
                    }
                  },
                  onStoryShow: (storyItem) {
                    
                  },
                  controller: controller,
                  inline: false,
                  repeat: false,
                );
              }
            ),
            Positioned(
              left: 30,
              top: 70,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop(listaHistoriasVistas);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}