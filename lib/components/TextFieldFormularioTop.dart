import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color rosaPaula = Color(0xffFA879E);

class TextFieldFormularioTop extends StatelessWidget {

  final TextEditingController controller;
  final Icon icon;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> mascara;
  final double padding;
  final Function onSaved;
  final Function validator;

  TextFieldFormularioTop({
    @required this.labelText,
    @required this.hintText,
    @required this.controller,
    @required this.onSaved,
    @required this.validator,
    this.icon,
    this.keyboardType,
    this.mascara,
    this.padding = 15,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        maxLines: 3,
        minLines: 1,
        style: TextStyle(fontSize: 20.0, color: Colors.black),
        inputFormatters: mascara,
        autofocus: false,
        autocorrect: true,
        autovalidate: true,//
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
            //mudar cor da linha
            borderSide: BorderSide(color: rosaPaula),
          ),
          icon: icon,
        ),
      ) ,
    );
  }
}
