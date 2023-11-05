import 'package:adventurista/Views/story_view.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({ Key? key }) : super(key: key);

  @override
  _PrincipalViewState createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {

  

  double width = 0;
  double height = 0;

  // icono de me gusta
  IconData iconoMeGusta = Icons.favorite_border;
  // icono de bookmark
  IconData iconoBookmark = Icons.bookmark_border;

  List<List<Color>> listaColoresGradientList = List.generate(10, (index) => [Colors.blue, Colors.red]);

  // metodo para obtener el tamaño de la pantalla
  getSize() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    getSize();
    return Scaffold(
      body: FittedBox(
        fit: BoxFit.contain,
        child: SizedBox(
          width: width,
          height: height - 66,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Adventurista'),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: historias(),
              ),
              SliverList.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return publicaciones(index: index);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  historias() {
    return Container(
      height: 120,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5
          )
        )
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          List<Color> listaColoresGradient = listaColoresGradientList[index];
          return InkWell(
            onTap: () async {
              List<int> listaHistoriasVistas = [];
              listaHistoriasVistas = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StoryViewP(index: index,)
                )
              );
              // por cada historia vista se pondra el borde en gris
              listaHistoriasVistas.forEach((element) {
                setState(() {
                  listaColoresGradientList[element] = [
                    Colors.grey[700]!,
                    Colors.grey[300]!,
                    Colors.grey[900]!,
                  ];
                });
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: SizedBox(
                width: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: 75,
                        height: 75,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: listaColoresGradient,
                              // transform: GradientRotation(0.1) 
                            ),
                            width: 2,
                          ),
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/imagen_logo.jpg'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        )
                      ),
                    ),
                    Text(
                      'Historia $index',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }


  publicaciones({required int index}){
    
    return Container(
      color: Colors.white,
      width: width,
      height: 550,
      child: Column(
        children: [
          partePerfil(index: index),
          Expanded(
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration:const  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/imagen_logo.jpg'),
                      fit: BoxFit.contain
                    )
                  ),
                ),
              ),
            ),
          ),
          parteLikeYComenarios(index: index),
          const SizedBox(height: 20,)
        ],
      )
    );
  }

  partePerfil({required int index}){
    return Container(
      height: 60,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    List<int> listaHistoriasVistas = [];
                    listaHistoriasVistas = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StoryViewP(index: index,)
                      )
                    );
                    // por cada historia vista se pondra el borde en gris
                    listaHistoriasVistas.forEach((element) {
                      setState(() {
                        listaColoresGradientList[element] = [
                          const Color.fromARGB(255, 146, 136, 136),
                          Colors.grey[300]!,
                          Colors.grey[900]!,
                        ];
                      });
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/imagen_logo.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Text(
                  'Publicado por: Usuario ${index + 1}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.more_vert),
            ),
          )
        ],
      ),
    );
  }

  parteLikeYComenarios({required int index}){
    return Container(
      height: 50,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  setState(() {
                    if(iconoMeGusta == Icons.favorite_border){
                      iconoMeGusta = Icons.favorite;
                    }else{
                      iconoMeGusta = Icons.favorite_border;
                    }
                  });
                },
                icon: Icon(iconoMeGusta),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.comment),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.send),
              ),
            ],
          ),
          IconButton(
            onPressed: (){
              setState(() {
                if(iconoBookmark == Icons.bookmark_border){
                  iconoBookmark = Icons.bookmark;
                }else{
                  iconoBookmark = Icons.bookmark_border;
                }
              });
            },
            icon: Icon(iconoBookmark),
          ),
        ],
      ),
    );
  }


}