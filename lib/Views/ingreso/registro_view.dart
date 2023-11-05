import 'package:adventurista/Components/text_field_adventure.dart';
import 'package:adventurista/Constants/colors.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({ Key? key }) : super(key: key);

  @override
  _RegistroViewState createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {

  final _formKey = GlobalKey<FormState>();


  double width = 0;
  double height = 0;

  double imagenOpaca = 0;
  double contenidoOpaco = 0;
  double botonOpaco = 0;

  bool active = false;
  bool active2 = false;
  bool obscureText = true;
  bool obscureText2 = true;

  FocusNode focusNodeN = FocusNode();
  FocusNode focusNodeA = FocusNode();
  FocusNode focusNodeC = FocusNode();
  FocusNode focusNodeP = FocusNode();
  FocusNode focusNodeP2 = FocusNode();

  Icon icN = const Icon(
    Icons.person_outline,
    color: Colors.white,
  );
  Icon icA = const Icon(
    Icons.person_outline,
    color: Colors.white,
  );
  Icon icC = const Icon(
    Icons.email_outlined,
    color: Colors.white,
  );
  Icon icP = const Icon(
    Icons.lock_outline_rounded,
    color: Colors.white,
  );
  Icon icP2 = const Icon(
    Icons.lock_outline_rounded,
    color: Colors.white,
  );

  String nombre = '';
  String apellido = '';
  String correo = '';
  String password = '';
  String password2 = '';
  String error = '';

  @override
  void initState() {
    super.initState();
    metodoAnimado();
    focusNodeN = FocusNode();
    focusNodeA = FocusNode();
    focusNodeC = FocusNode();
    focusNodeP = FocusNode();
    focusNodeP2 = FocusNode();

    focusNodeN.addListener(nombreFocus);
    focusNodeA.addListener(apellidoFocus);
    focusNodeC.addListener(correoFocus);
    focusNodeP.addListener(passwordFocus);
    focusNodeP2.addListener(password2Focus);
  }

  nombreFocus(){
    if (focusNodeN.hasFocus) {
      setState(() {
        icN = const Icon(
          Icons.person,
          color: Colors.white,
        );
      });
    } else {
      cambioEstadoVariables();
    }
  }

  apellidoFocus(){
    if (focusNodeA.hasFocus) {
      setState(() {
        icA = const Icon(
          Icons.person,
          color: Colors.white,
        );
      });
    } else {
      cambioEstadoVariables();
    }
  }

  correoFocus(){
    if (focusNodeC.hasFocus) {
      setState(() {
        icC = const Icon(
          Icons.email,
          color: Colors.white,
        );
      });
    } else {
      cambioEstadoVariables();
    }
  }

  passwordFocus(){
    if (focusNodeP.hasFocus) {
      setState(() {
        icP = const Icon(
          Icons.lock,
          color: Colors.white,
        );
        active = true;
      });
    } else {
      cambioEstadoVariables();
    }
  }

  password2Focus(){
    if (focusNodeP2.hasFocus) {
      setState(() {
        icP2 = const Icon(
          Icons.lock,
          color: Colors.white,
        );
        active2 = true;
      });
    } else {
      cambioEstadoVariables();
    }
  }

  @override
  void dispose() {
    focusNodeN.dispose();
    focusNodeA.dispose();
    focusNodeC.dispose();
    focusNodeP.dispose();
    focusNodeP2.dispose();

    focusNodeN.removeListener(nombreFocus);
    focusNodeA.removeListener(apellidoFocus);
    focusNodeC.removeListener(correoFocus);
    focusNodeP.removeListener(passwordFocus);
    focusNodeP2.removeListener(password2Focus);

    super.dispose();
  }

  // metodo para obtener el tamaño de la pantalla
  resolucion(BuildContext context) {
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }

  cambioEstado(){
    cambioEstadoVariables();

    final FocusScopeNode focus = FocusScope.of(context);

    if (!focus.hasPrimaryFocus && focus.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  cambioEstadoVariables(){
    setState(() {
      icN = const Icon(
        Icons.person_outline,
        color: Colors.white,
      );
      icA = const Icon(
        Icons.person_outline,
        color: Colors.white,
      );
      icC = const Icon(
        Icons.email_outlined,
        color: Colors.white,
      );
      icP = const Icon(
        Icons.lock_outline_rounded,
        color: Colors.white,
      );
      icP2 = const Icon(
        Icons.lock_outline_rounded,
        color: Colors.white,
      );
      active = false;
      active2 = false;
    });
  }

  Future<bool> cambioEstadoWillPop() {
    final FocusScopeNode focus = FocusScope.of(context);
    if (!focus.hasPrimaryFocus && focus.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
      cambioEstadoVariables();
      return Future.value(false);
    } else {
      cambioEstadoVariables();
      return Future.value(true);
    }
  }

  metodoAnimado() async {
    
    await Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        imagenOpaca = 1.0;
      });
    });

    await Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        contenidoOpaco = 1.0;
      });
    });

    await Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        botonOpaco = 1.0;
      });
    });
  }


  onChangeNombre(String value){
    setState(() {
      nombre = value;
    });
  }

  onChangeApellido(String value){
    setState(() {
      apellido = value;
    });
  }

  onChangeCorreo(String value){
    setState(() {
      correo = value;
    });
  }

  onChangePassword(String value){
    setState(() {
      password = value;
    });
  }

  onChangePassword2(String value){
    setState(() {
      password2 = value;
    });
  }

  String? validator(String? value){
    if (value == null || value.trim().isEmpty) {
      error = 'Tienes un campo vacio';
      return 'Campo requerido';
    } else {
      return null;
    }
  }

  String? validatorV(String? value){
    if (value == null || value.trim().isEmpty) {
      error = 'Tienes un campo vacio';
      return 'Campo requerido';
    } else if(password2 != password){
      error = 'Las contraseñas no coinciden';
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    resolucion(context);
    return GestureDetector(
      onTap: cambioEstado,
      child: WillPopScope(
        onWillPop: cambioEstadoWillPop,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  fondoAnimado(),
                  // Positioned(
                  //   top: 30,
                  //   left: 30,
                  //   child: IconButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     icon: const Icon(
                  //       Icons.arrow_back_ios,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  cuerpoAnimado(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  fondoAnimado(){
    return Positioned(
      top: 0,
      left: 0,
      bottom: 0,
      right: 0,
      child: FadeInDown(
        duration: const Duration(milliseconds: 1000),
        from: 1000,
        child: Image.asset(
          'assets/images/fondo_login.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  cuerpoAnimado(){
    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: width,
            height: height-AppBar().preferredSize.height,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  imagen(),
                  AnimatedOpacity(
                    opacity: contenidoOpaco, 
                    duration: const Duration(milliseconds: 500), 
                    child: SizedBox(
                      height: height*0.6,
                      child: Column(
                        children: [
                          const Gap(10),
                          nombreT(),
                          const MaxGap(20),
                          apellidoT(),
                          const MaxGap(20),
                          correoT(),
                          const MaxGap(20),
                          passwordT(),
                          const MaxGap(20),
                          password2T(),
                        ],
                      ),
                    )
                  ),
                  botonIngresar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  imagen(){
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      opacity: imagenOpaca,
      child: Image.asset(
        'assets/images/imagen_logo.jpg',
        width: 200,
        height: height * 0.2,
        fit: BoxFit.contain,
      ),
    );
  }

  nombreT(){
    return TextFieldAdventure(
      onChanged: onChangeNombre, 
      validator: validator, 
      labelText: 'Nombre',
      focusNode: focusNodeN,
      prefixIcon: icN,
    );
  }

  apellidoT(){
    return TextFieldAdventure(
      onChanged: onChangeApellido, 
      validator: validator, 
      labelText: 'Apellido',
      focusNode: focusNodeA,
      prefixIcon: icA,
    );
  }

  correoT(){
    return TextFieldAdventure(
      onChanged: onChangeCorreo, 
      validator: validator, 
      labelText: 'Correo',
      focusNode: focusNodeC,
      prefixIcon: icC,
    );
  }

  passwordT(){
    return TextFieldAdventure(
      onChanged: onChangePassword, 
      validator: validator, 
      labelText: 'Contraseña',
      obscureText: obscureText,
      focusNode: focusNodeP,
      prefixIcon: icP,
      suffixIcon: IconButton(
        padding: const EdgeInsetsDirectional.only(end: 12),
        icon: active  ? obscureText
            ?  const Icon(Icons.visibility, color: Colors.white,)
            :  const Icon(Icons.visibility_off,color: Colors.white,) 
          : obscureText
            ?  const Icon(Icons.visibility_outlined, color: Colors.white,)
            :  const Icon(Icons.visibility_off_outlined,color: Colors.white,),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
    );
  }

  password2T(){
    return TextFieldAdventure(
      onChanged: onChangePassword2, 
      validator: validatorV, 
      labelText: 'Verificar contraseña',
      obscureText: obscureText2,
      focusNode: focusNodeP2,
      prefixIcon: icP2,
      suffixIcon: IconButton(
        padding: const EdgeInsetsDirectional.only(end: 12),
        icon: active2  ? obscureText2
            ?  const Icon(Icons.visibility, color: Colors.white,)
            :  const Icon(Icons.visibility_off,color: Colors.white,) 
          : obscureText2
            ?  const Icon(Icons.visibility_outlined, color: Colors.white,)
            :  const Icon(Icons.visibility_off_outlined,color: Colors.white,),
        onPressed: () {
          setState(() {
            obscureText2 = !obscureText2;
          });
        },
      ),
    );
  }

  botonIngresar(){
    return AnimatedOpacity(
      opacity: botonOpaco,
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
        onPressed: (){
          if (_formKey.currentState!.validate()) {
            cambioEstado();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Has sido registrado correctamente'),
                backgroundColor: Colors.green,
              )
            );
            
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error),
                backgroundColor: Colors.red,
              )
            );
          }
        }, 
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.advBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            )
          )
        ),
        child: const Text(
          'Ingresar',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}