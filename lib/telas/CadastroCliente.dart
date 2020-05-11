import 'package:beautydesign/customWidgets/SwitchlikeCheckbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class CadastroCliente extends StatefulWidget {
  @override
  _CadastroClienteState createState() => _CadastroClienteState();
}

//OPÇÕES DE ATENDIMENTOS

class Atendimentos {
  final int _key;
  final String _value;
  Atendimentos(this._key, this._value);
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
  bool _infoContato = false;
  bool _infoTratamento = true;
  bool _infoAvaliacao = true;
  bool _infoAutorizacao = true;

  //Variáveis iniciais
  Color rosaPaula = Color(0xffFA879E);
  FocusNode myFocusNode;
  int _opcaoAtendimento = 1;
  String _dataAgendamento = " Selecione a data";


  //Controles icones
  bool resultadoPergunta1 = false;
  bool resultadoPergunta2 = false;
  bool resultadoPergunta3 = false;
  bool resultadoPergunta4 = false;
  bool resultadoPergunta5 = false;
  bool resultadoPergunta6 = false;
  bool resultadoPergunta7 = false;
  bool resultadoPergunta8 = false;
  bool resultadoPergunta9 = false;
  bool resultadoPergunta10 = false;
  bool resultadoPergunta11 = false;
  bool resultadoPergunta12 = false;



  final _buttonOptions = [
    Atendimentos(1,"Bonny Browns"),
    Atendimentos(2,"Natural Lips"),
    Atendimentos(3,"DD Glow"),
    Atendimentos(4,"Black Lashes"),
  ];


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
          padding: EdgeInsets.all(5),
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
                      ),
                      _infoTratamento
                          ? Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 30,right: 30),
                                child:SizedBox(
                                 // height: MediaQuery.of(context).size.width/4,
                                  height: _buttonOptions.length * 30.0,
                                  //width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                    padding: EdgeInsets.all(0.0),
                                    children: _buttonOptions.map((timeValue) => RadioListTile(
                                      groupValue: _opcaoAtendimento,
                                      title: Text(timeValue._value),
                                      value: timeValue._key,
                                      onChanged: (val) {
                                        setState(() {
                                          debugPrint('VAL = $val');
                                          _opcaoAtendimento = val;
                                        });
                                      },
                                    )).toList(),
                                  ),
                                ) ,
                              ),
                              //DATA PICKER
                              Padding(
                                  padding: EdgeInsets.only(right: 30,left: 30),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  elevation: 4.0,
                                  onPressed: () {

                                    DatePicker.showDatePicker(context,
                                      theme: DatePickerTheme(
                                        containerHeight: 210.0,
                                      ),
                                      showTitleActions: true,
                                      locale: LocaleType.pt,
                                      minTime: DateTime(2019, 1, 1),
                                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                                        print('confirm $date');
                                        setState(() {
                                          _dataAgendamento = ' ${date.day} - ${date.month} - ${date.year}';
                                        });
                                      },
                                      // currentTime: DateTime.now(), locale: LocaleType.en
                                    );

                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.date_range,
                                                    size: 18.0,
                                                    color: rosaPaula,
                                                  ),
                                                  Text(
                                                    _dataAgendamento,
                                                    style: TextStyle(
                                                        color: rosaPaula,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20.0),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "  ALTERAR",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              //Botao adicionar
                              /*Padding(
                                padding: EdgeInsets.only(top:10, right: 30,left: 30),
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  elevation: 4.0,
                                  onPressed: () {
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: Text("Adicionar",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  color: rosaPaula,
                                ),
                              )*/

                            ],
                      )
                          : Container()
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
                      ),
                      _infoAvaliacao
                      ? Column(
                        children: <Widget>[
                          //Primeira Pergunta
                          Padding(
                              padding: EdgeInsets.only(right: 30,left: 30),
                            child: Column(
                          children: <Widget>[
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("• Esta em tratamento médico?",
                                style: TextStyle(
                                    fontSize: 20
                                ),),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    resultadoPergunta1 = !resultadoPergunta1;
                                  });
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SwitchlikeCheckbox(checked: resultadoPergunta1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                            resultadoPergunta1
                              ? TextField(
                            keyboardType: TextInputType.text,
                            controller: _nomeController ,
                            style: TextStyle(fontSize: 20.0, color: Colors.black),
                            autofocus: false,
                            onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                            decoration: InputDecoration(
                              labelText: "Especifique: ",
                              labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                              hintText: "Especifique..",
                              focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                  borderSide: BorderSide(color: rosaPaula)
                              ),
                              //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                            ),
                          )
                              : Container()
                        ],
                      )
                          ),
                          //Segunda Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Tem alergia?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta2 = !resultadoPergunta2;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta2),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta2
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Terceira Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Fez cirurgia recentemente?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta3 = !resultadoPergunta3;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta3),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta3
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Quarta pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Tem cicatriz facil?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta4 = !resultadoPergunta4;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta4),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta4
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Quinta Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Há marcas de expressão facial?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta5 = !resultadoPergunta5;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta5),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta5
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Sexta Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Tem diabetes?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta6 = !resultadoPergunta6;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta6),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta6
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Setima Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Tem quelóide?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta7 = !resultadoPergunta7;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta7),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta7
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Oitava Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• É gestante?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta8 = !resultadoPergunta8;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta8),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta8
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Nona Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Está em tratamento de HIV?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta9 = !resultadoPergunta9;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta9),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta9
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Decima pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Tem hipo/hipertensão arterial?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta10 = !resultadoPergunta10;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta10
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Decima primeira Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Está utilizando ácidos?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta11 = !resultadoPergunta11;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta11),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta11
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          ),
                          //Decima segunda Pergunta
                          Padding(
                              padding: EdgeInsets.only(top:10, right: 30,left: 30),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("• Existe algum problema que \n julgue ser necessário informar \n ao profissional?",
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                        maxLines: 3,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            resultadoPergunta12 = !resultadoPergunta12;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            SwitchlikeCheckbox(checked: resultadoPergunta12),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  resultadoPergunta12
                                      ? TextField(
                                    keyboardType: TextInputType.text,
                                    controller: _nomeController ,
                                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                                    autofocus: false,
                                    onEditingComplete: ()=> FocusScope.of(context).requestFocus(myFocusNode),
                                    decoration: InputDecoration(
                                      labelText: "Especifique: ",
                                      labelStyle: TextStyle(fontSize: 20.0, color: rosaPaula),
                                      hintText: "Especifique..",
                                      focusedBorder: UnderlineInputBorder( //mudar cor da linha
                                          borderSide: BorderSide(color: rosaPaula)
                                      ),
                                      //icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                    ),
                                  )
                                      : Container()
                                ],
                              )
                          )
                        ],
                      )
                      : Container()
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
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
