import 'package:flutter/material.dart';

final Color rosaPaula = Color(0xffFA879E);

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomButton({
    @required this.label,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 4.0,
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            color: rosaPaula,
            padding: EdgeInsets.symmetric(
                vertical: 15), //padding para aumentar tamanho do botao
            onPressed: onPressed
        ),
      ),
    );
  }
}
