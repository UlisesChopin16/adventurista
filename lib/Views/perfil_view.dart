import 'package:adventurista/Constants/colors.dart';
import 'package:adventurista/Views/story_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({ Key? key }) : super(key: key);

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {

  double width = 0;
  double height = 0;

  List<List<Color>> listaColoresGradientList = List.generate(10, (index) => [Colors.blue, Colors.red]);

  getSize() {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }


  @override
  Widget build(BuildContext context) {
    getSize();
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        animationDuration: const Duration(milliseconds: 300),
        child: Container(
          color: Colors.white,
          child: NestedScrollView(
        
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    title: const Text('NombreUsuario'),
                    leading: Container(),
                    leadingWidth: 0,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_box_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: width,
                      height: 10,
                      color: Colors.white,
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: Container(
                      width: width,
                      height: 85,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // circulo de la foto
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/imagen_logo.jpg'),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                          ),
              
                          // publicaciones, seguidores, seguidos
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 40.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        'Publicaciones',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        'Seguidores',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        'Seguidos',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SliverList(
                    delegate: SliverChildListDelegate(
                      const [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Ulises Shie Sotelo Chopin',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Gap(5),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Descripción\nDescripción\nDescripción\nDescripción\nDescripción\nDescripción\n',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ]
                    ), 
                  ),
                  const SliverGap(10),
                  // botones de editar perfil y compartir perfil
                  SliverToBoxAdapter(
                    child: Container(
                      width: width,
                      height: 40,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: (){},
                                child: const Text('Editar perfil'),
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: (){},
                                child: const Text('Compartir perfil'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverGap(10),
                  // publicaciones, etiquetas, guardados}
                  SliverToBoxAdapter(
                    child: historias(),
                  ),
                  const SliverGap(10),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: ProfileTabBar(
                      child: Container(
                        color: Colors.white,
                        child: TabBar(
                          labelColor: Palette.advBlue,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Palette.advBlue,
                          tabs: const [
                            Tab(
                              icon: Icon(Icons.grid_on_outlined),
                            ),
                            Tab(
                              icon: Icon(Icons.tag_outlined),
                            ),
                            Tab(
                              icon: Icon(Icons.bookmark_border_outlined),
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  // publicaciones
                  gridViewPerfil(Colors.green),
                  // etiquetas
                  gridViewPerfil(Colors.red),
                  // guardados
                  gridViewPerfil(Colors.grey,),
                ],
              )
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
        color: Colors.white
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

  gridViewPerfil(Color color){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: 100,
      itemBuilder: (context, index){
        return Container(
          width: width,
          height: 100,
          color: color,
        );
      },
    );
  }
}

class ProfileTabBar extends SliverPersistentHeaderDelegate{
  final Widget child;
  ProfileTabBar({
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}