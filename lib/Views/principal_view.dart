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
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              historias(),
            ],
          ),
        ),
      ),
    );
  }

  historias() {
    return Container(
      height: 120,
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
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print('historia $index');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,),
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
                        decoration: const BoxDecoration(
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.red,
                              ],
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
}