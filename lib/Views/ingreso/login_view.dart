import 'package:adventurista/Components/text_field_adventure.dart';
import 'package:adventurista/Constants/colors.dart';
import 'package:adventurista/Views/ingreso/registro_view.dart';
import 'package:adventurista/Views/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final _formKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool active = false;


  double width = 0.0;
  double height = 0.0;

  double fondoOpaco = 0.0;
  double contenidoOpaco = 0.0;
  double imagenOpaca = 0.0;



  FocusNode focusNodeU = FocusNode();
  FocusNode focusNodeP = FocusNode();


  late Icon ic = const Icon(Icons.lock_outline_rounded, color: Colors.white, );
  late Icon icu = const Icon(Icons.person_outline, color: Colors.white, );


  String usuario = '';
  String password = '';

  resolucion(BuildContext context){
    setState(() {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    });
  }

  void onChangeUsuario(String value){
    setState(() {
      usuario = value;
    });
  }

  void onChangePassword(String value){
    setState(() {
      password = value;
    });
  }

  String? validator(String? value){
    if(value == null || value.trim().isEmpty){
      return 'El campo no puede estar vacio';
    }
    return null;
  }

  metodoAnimado() async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        fondoOpaco = 1.0;
      });
    });
    await Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        imagenOpaca = 1.0;
      });
    });

    await Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        contenidoOpaco = 1.0;
      });
    });
  }

  metodoLanzarRegistro(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegistroView(),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    metodoAnimado();

    focusNodeU = FocusNode();
    focusNodeP = FocusNode();

    focusNodeU.addListener(_listenerU);
    focusNodeP.addListener(_listenerP);
  }

  void _listenerU() {
    if (focusNodeU.hasFocus) {
      setState(() {
        icu = const Icon(
          Icons.person,
          color: Colors.white,
        );
      });
    } else {
      cambioEstadoVariables();
    }
  }

  void _listenerP() {
    if (focusNodeP.hasFocus) {
      setState(() {
        ic = const Icon(
          Icons.lock_rounded,
          color: Colors.white,
        );
        active = true;
      });
      // print('active');
    } else {
      cambioEstadoVariables();
    }
  }

  @override
  void dispose() {
    focusNodeU.removeListener(_listenerU);
    focusNodeP.removeListener(_listenerP);
    focusNodeU.dispose();
    focusNodeP.dispose();
    super.dispose();
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
      ic = const Icon(
        Icons.lock_outline_rounded,
        color: Colors.white,
        
      );
      icu = const Icon(
        Icons.person_outline,
        color: Colors.white,
        
      );
      active = false;
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

  @override
  Widget build(BuildContext context) {
    resolucion(context);
    return GestureDetector(
      onTap: cambioEstado,
      child: WillPopScope(
        onWillPop: cambioEstadoWillPop,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  fondoAnimado(),
                  cuerpoAnimado(),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: FadeInLeft(
                      duration: const Duration(milliseconds: 1000),
                      from: 1000,
                      delay: const Duration(milliseconds: 1000),
                      child: TextButton(
                        onPressed: (){}, 
                        child: const Text(
                          'Terminos & condiciones',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  )
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
      top: -10,
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
      top: -40,
      left: 0,
      bottom: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    imagen(),
                    SizedBox(height: height * 0.05,),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      opacity: contenidoOpaco,
                      child: Column(
                        children: [
                          usuarioT(),
                          const Gap(30),
                          passwordT(),
                          const Gap(10),
                          olvidastePassword(),
                          Gap(height * 0.03),
                          botonIngresar(),
                          const Gap(20),
                          InkWell(
                            onTap: metodoLanzarRegistro,
                            child: const Text(
                              '¿No tienes cuenta?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
        width: width * 0.8,
        height: height * 0.32,
        fit: BoxFit.contain,
      ),
    );
  }

  usuarioT(){
    return TextFieldAdventure(
      onChanged: onChangeUsuario, 
      validator: validator, 
      labelText: 'Usuario',
      focusNode: focusNodeU,
      prefixIcon: icu,
    );
  }

  passwordT(){
    return TextFieldAdventure(
      onChanged: onChangePassword, 
      validator: validator, 
      labelText: 'Contraseña',
      obscureText: obscureText,
      focusNode: focusNodeP,
      prefixIcon: ic,
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

  olvidastePassword(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: (){}, 
          child: const Text(
            '¿Olvidaste tu contraseña?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  botonIngresar(){
    return ElevatedButton(
      onPressed: (){
        if (_formKey.currentState!.validate()) {
          cambioEstado();
          if(usuario.trim() == 'admin' && password.trim() == 'admin'){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MenuView(),
              )
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bienvenido'),
                backgroundColor: Colors.green,
              )
            );
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Usuario o contraseña incorrectos'),
                backgroundColor: Colors.red,
              )
            );
          }
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
    );
  }
}