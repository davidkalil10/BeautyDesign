import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroCliente extends StatefulWidget {
  @override
  _CadastroClienteState createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {

  //FIELDS CONTROLLERS
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _nascimentoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _instagramController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _atividadeController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _comoconheceuController = TextEditingController();

  //MASCARAS DE TEXT FIELD
  var mascaraTelefone = new MaskTextInputFormatter(mask: '+## (##) #####-####', filter: { "#": RegExp(r'[0-9]') });
  var mascaraCPF = new MaskTextInputFormatter(mask: '###.###.###-##');
  var mascaraNascimento = new MaskTextInputFormatter(mask: '##/##/####');

  //Controles icones
  bool _infoContato = true;
  bool _infoTratamento = true;
  bool _infoAvaliacao = true;
  bool _infoAutorizacao = true;

  //Variáveis iniciais
  Color rosaPaula = Color(0xffFA879E);
  FocusNode myFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    super.dispose();
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: (){
                          setState(() {
                            _infoContato = !_infoContato;
                          });
                        },
                        label: Text("Informações de Contato",style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: rosaPaula),),
                        icon: _infoContato? Icon(FontAwesomeIcons.chevronDown,color: rosaPaula,) : Icon(FontAwesomeIcons.chevronRight,color: rosaPaula,),
                      ),
                      _infoContato
                       ? Column(
                        children: <Widget>[
                          //Nome e sobrenome
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  controller: _nomeController ,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                  decoration: InputDecoration(
                                    labelText: "Nome completo",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "Digite seu nome completo..",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Nascimento e telefone
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.datetime,
                                  controller: _nascimentoController,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  inputFormatters: [mascaraNascimento],
                                  decoration: InputDecoration(
                                    labelText: "Nascimento",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "Digite sua dat de nascimento..",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.birthdayCake,color: rosaPaula),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  controller: _telefoneController ,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  inputFormatters: [mascaraTelefone],
                                  decoration: InputDecoration(
                                    labelText: "Telefone",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "+xx (xx) xxxxx-xxxx",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.whatsapp,color: rosaPaula),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //Instagram e Email
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _instagramController,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    labelText: "Instagram",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "@..",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.instagram,color: rosaPaula),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController ,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    labelText: "E-mail",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "Digite seu e-mail..",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.at,color: rosaPaula),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //Atividade e CPF
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  controller: _atividadeController,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    labelText: "Atividade",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "Digite seu ramo de atividade..",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.briefcase,color: rosaPaula),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: _cpfController ,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  inputFormatters: [mascaraCPF],
                                  decoration: InputDecoration(
                                    labelText: "CPF",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "Digite seu CPF..",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.idCard,color: rosaPaula),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //Endereço e como conheceu
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  controller: _enderecoController,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  minLines: 1,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    labelText: "Endereço",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "Digite seu endereço..",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.mapMarkerAlt,color: rosaPaula),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  controller: _comoconheceuController ,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                                  autofocus: false,
                                  minLines: 1,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    labelText: "Como nos conheceu",
                                    labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                    hintText: "Digite como nos conheceu..",
                                    focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                        borderSide: BorderSide(color: rosaPaula)
                                    ),
                                    icon: Icon(FontAwesomeIcons.questionCircle,color: rosaPaula),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                       : Container()
                    ],
                  ),
                  //Tratamentos a serem feitos
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: (){
                          setState(() {
                            _infoTratamento = !_infoTratamento;
                          });
                        },
                        label: Text("Tratamentos a serem feitos",style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: rosaPaula),),
                        icon: _infoTratamento? Icon(FontAwesomeIcons.chevronDown,color: rosaPaula,) : Icon(FontAwesomeIcons.chevronRight,color: rosaPaula,),
                      )
                    ],
                  ),
                  //AVALIAÇÃO
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: (){
                          setState(() {
                            _infoAvaliacao = !_infoAvaliacao;
                          });
                        },
                        label: Text("Avaliação",style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: rosaPaula),),
                        icon: _infoAvaliacao? Icon(FontAwesomeIcons.chevronDown,color: rosaPaula,) : Icon(FontAwesomeIcons.chevronRight,color: rosaPaula,),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: (){
                          setState(() {
                            _infoAutorizacao = !_infoAutorizacao;
                          });
                        },
                        label: Text("Autorização",style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: rosaPaula),),
                        icon: _infoAutorizacao? Icon(FontAwesomeIcons.chevronDown,color: rosaPaula,) : Icon(FontAwesomeIcons.chevronRight,color: rosaPaula,),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20,left: 20, right: 20),
                    child: RaisedButton(
                        child: Text(
                          "Finalizar",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        color: rosaPaula,
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15), //padding para aumentar tamanho do botao
                        onPressed: (){}
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
