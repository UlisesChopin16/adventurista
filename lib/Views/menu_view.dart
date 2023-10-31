import 'package:adventurista/Constants/colors.dart';
import 'package:adventurista/Views/principal_view.dart';
import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  const MenuView({ Key? key }) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {

  bool boton1 = true;
  bool boton2 = false;
  bool boton3 = false;
  bool boton4 = false;

  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:  [
          const PrincipalView(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Palette.advBlue,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: 0,
        onTap: (index) {
          // dependiendo de la posicion del index se pone en true el boton
          // y en false los demas
          if (index == 0) {
            setState(() {
              boton1 = true;
              boton2 = false;
              boton3 = false;
              boton4 = false;
            });
          } else if (index == 1) {
            setState(() {
              boton1 = false;
              boton2 = true;
              boton3 = false;
              boton4 = false;
            });
          } else if (index == 2) {
            setState(() {
              boton1 = false;
              boton2 = false;
              boton3 = true;
              boton4 = false;
            });
          } else if (index == 3) {
            setState(() {
              boton1 = false;
              boton2 = false;
              boton3 = false;
              boton4 = true;
            });
          }

          _pageController.jumpToPage(
            index,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35,
              color: boton1 ? Palette.advBlue : Colors.grey,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/pin.png',
              width: 50,
              height: 35,
              color: boton2 ? null : Colors.grey,
              colorBlendMode: BlendMode.srcATop,
            ),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection,
              size: 35,
              color: boton3 ? Palette.advBlue : Colors.grey,
            ),
            label: 'Rutas',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 35,
              color: boton4 ? Palette.advBlue : Colors.grey,
            ),
            label: 'Perfil',
          ),
        ],
      )
    );
  }
}