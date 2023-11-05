import 'package:flutter/material.dart';

class TextFieldAdventure extends StatelessWidget {

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? labelText;

  final bool? obscureText;

  final FocusNode? focusNode;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextFieldAdventure({ 
    Key? key,
    required this.onChanged,
    required this.validator,
    required this.labelText,
    required this.focusNode,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  estiloUnderLine(){
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white
      )
    );
  }

  estiloLabelText(){
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }

  @override
  Widget build(BuildContext context){
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      obscureText: obscureText ?? false,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
        constraints: const BoxConstraints(
          maxHeight: 70,
        ),
        labelText: labelText,
        labelStyle: estiloLabelText(),
        focusedBorder: estiloUnderLine(),
        enabledBorder: estiloUnderLine(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}