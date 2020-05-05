import 'package:beautydesign/telas/TelaPrincipal.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  _checarSenha(){

    if (_emailController.text == "paula@beautydesign.com" && _senhaController.text == "Davidbonitao19"){

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=> TelaPrincipal()));

    }else{

      setState(() {
        final snackbar = SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Usuário ou senha incorreta"),

        );
        Scaffold.of(context).showSnackBar(snackbar);
      });


    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset("assets/capa.png"),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController ,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(fontSize: 20.0, color: Colors.pink[100]),
                        hintText: "Digite seu e-mail..",
                        focusedBorder: UnderlineInputBorder( //mudar cor da linha
                            borderSide: BorderSide(color: Colors.pink[100])
                        ),
                        icon: Icon(
                          Icons.email,
                          color: Colors.pink[100],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: _senhaController ,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(fontSize: 20.0, color: Colors.pink[100]),
                        hintText: "Digite sua senha..",
                        focusedBorder: UnderlineInputBorder( //mudar cor da linha
                            borderSide: BorderSide(color: Colors.pink[100])
                        ),
                        icon: Icon(
                          Icons.vpn_key,
                          color: Colors.pink[100],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 20, right: 20),
                    child: RaisedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        color: Colors.pink[100],
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15), //padding para aumentar tamanho do botao
                        onPressed: (){

                          if (_emailController.text == "paula@beautydesign.com" && _senhaController.text == "Davidbonitao19"){

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context)=> TelaPrincipal()));

                          }else{


                          }


                        }
                    ),
                  ),
                  FlatButton(
                      onPressed: (){
                      },
                      child: Text(
                        "Não tem uma conta? Cadastre-se!",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
