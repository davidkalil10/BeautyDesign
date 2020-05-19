import 'package:beautydesign/components/CustomButton.dart';
import 'package:beautydesign/components/CustomDropdown.dart';
import 'package:beautydesign/components/SwitchlikeCheckbox.dart';
import 'package:beautydesign/components/TextFieldFormulario.dart';
import 'package:beautydesign/components/TextFieldFormularioTop.dart';
import 'package:beautydesign/components/cliente.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:signature/signature.dart';
import 'package:validate/validate.dart';

class CadastroCliente extends StatefulWidget {
  @override
  _CadastroClienteState createState() => _CadastroClienteState();
}

//DRAWER DA ASSINATURA

final SignatureController _signatureController = SignatureController(
  penStrokeWidth: 4,
  penColor: Colors.black54,
  exportBackgroundColor: Colors.white70,
);

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

  TextEditingController _p1Controller = TextEditingController();
  TextEditingController _p2Controller = TextEditingController();
  TextEditingController _p3Controller = TextEditingController();
  TextEditingController _p4Controller = TextEditingController();
  TextEditingController _p5Controller = TextEditingController();
  TextEditingController _p6Controller = TextEditingController();
  TextEditingController _p7Controller = TextEditingController();
  TextEditingController _p8Controller = TextEditingController();
  TextEditingController _p9Controller = TextEditingController();
  TextEditingController _p10Controller = TextEditingController();
  TextEditingController _p11Controller = TextEditingController();
  TextEditingController _p12Controller = TextEditingController();

  //MASCARAS DE TEXT FIELD
  final mascaraTelefone = new MaskTextInputFormatter(
      mask: '+## (##) #####-####', filter: {"#": RegExp(r'[0-9]')});
  final mascaraCPF = new MaskTextInputFormatter(mask: '###.###.###-##');
  final mascaraNascimento = new MaskTextInputFormatter(mask: '##/##/####');
  final mascaraInstagram = new MaskTextInputFormatter(mask: r'@AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');

  //Controles icones
  bool _infoContato = false;
  bool _infoTratamento = true;
  bool _infoAvaliacao = true;
  bool _infoAutorizacao = true;


  //VALIDADORES FORMULARIO
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  DadosCliente _cliente = new DadosCliente();

  String _validarNome(String value) {
    if (value.length <= 2) {return 'Insira um nome valido';}  return null;
  }
  String _validarNascimento(String value) {
    if (value.length < 10) {return 'Insira uma data correta';}  return null;
  }
  String _validarTelefone(String value) {
    if (value.length < 18) {return 'Insira um telefone correto';}  return null;
  }
  String _validarInstagram(String value) {
    if (value.length <= 2) {return 'Insira um ID valido';}  return null;
  }
  String _validarEmail(String value) {
    //if (value.length <= 2) {return 'Insira um e-mail valido';}  return null;
    try {Validate.isEmail(value);} catch (e) {
      return 'Insira um e-mail valido';
    }return null;
  }
  String _validarAtividade(String value) {
    if (value.length <= 2) {return 'Preencha a atividade';}  return null;
  }
  String _validarCPF(String value) {
    if (value.length < 14) {return 'Insira um CPF valido';}  return null;
  }
  String _validarEndereco(String value) {
    if (value.length <= 2) {return 'Insira um endereço válido';}  return null;
  }
  String _validarComoConheceu(String value) {
    if (value.length <= 2) {return 'Preencha como nos conheceu';}  return null;
  }

   void _validarCampos() {
     print("passei por aqui");
    // First validate form.
    if (this._formKey.currentState.validate()) {
       _formKey.currentState.save();
      // Save our form now.
      print('Printing dados do cliente');
      print('Nome: ${_cliente.nome}');
      print('Nascimento: ${_cliente.nascimento}');
      print('Telefone: ${_cliente.telefone}');
      print('Instagram: ${_cliente.instagram}');
      print('Email: ${_cliente.email}');
      print('Atividade: ${_cliente.atividade}');
      print('cpf: ${_cliente.cpf}');
      print('endereço: ${_cliente.endereco}');
      print('como conheceu: ${_cliente.comoConheceu}');
    }else{
      print('Há dados invalidos');
    }
  }

  _testeFunc(){
    print("testando");
  }


  //Variáveis iniciais
  Color rosaPaula = Color(0xffFA879E);
  FocusNode myFocusNode;
  int _opcaoAtendimento = 1;
  String _dataAgendamento = " Selecione a data";
  String _dataAssinatura = " Selecione a data";
  var data;
  bool _visualizarAssinatura = false;
  bool _assinaturaFeita = false;

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
    Atendimentos(1, "Bonny Browns (Sobrancelha)"),
    Atendimentos(2, "Natural Lips (Lábios)"),
    Atendimentos(3, "DD Glow"),
    Atendimentos(4, "Lashes Lifting (Cílios)"),
  ];

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    _signatureController.addListener(() => print("Value changed"));
  }

  @override
  void dispose() {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //INFORMAÇÕES DE CONTATO
                  CustomDropdown(
                      label: "Informações de Contato",
                      onPressed: () {
                        setState(() {
                          _infoContato = !_infoContato;
                        });
                      },
                      icon: _infoContato ? FontAwesomeIcons.chevronDown: FontAwesomeIcons.chevronRight),
                  _infoContato
                      ? Column(
                          children: <Widget>[
                            Form(
                              key: _formKey,
                              child: Column(
                               children: <Widget>[
                                 //Nome
                                 TextFieldFormularioTop(
                                     keyboardType: TextInputType.text,
                                     labelText: "Nome completo",
                                     hintText: "Digite seu nome completo..",
                                     controller: _nomeController,
                                     icon: Icon(FontAwesomeIcons.user,color: rosaPaula),
                                     onSaved: (String value) {
                                       _cliente.nome = value;
                                     },
                                     validator: _validarNome,
                                 ),
                                 //Nascimento
                                 TextFieldFormularioTop(
                                   keyboardType: TextInputType.datetime,
                                   labelText: "Nascimento",
                                   hintText: "Digite sua data de nascimento..",
                                   controller: _nascimentoController,
                                   icon: Icon(FontAwesomeIcons.birthdayCake,color: rosaPaula),
                                   mascara: [mascaraNascimento],
                                   onSaved: (String value) {
                                     _cliente.nascimento = value;
                                   },
                                   validator: _validarNascimento,
                                 ),
                                 //Telefone
                                 TextFieldFormularioTop(
                                   keyboardType: TextInputType.phone,
                                   labelText: "Telefone",
                                   hintText: "+xx (xx) xxxxx-xxxx",
                                   controller: _telefoneController,
                                   icon: Icon(FontAwesomeIcons.whatsapp,color: rosaPaula),
                                   mascara: [mascaraTelefone],
                                   onSaved: (String value) {
                                     _cliente.telefone = value;
                                   },
                                   validator: _validarTelefone,
                                 ),
                                 //Instagram
                                 TextFieldFormularioTop(
                                   keyboardType: TextInputType.text,
                                   labelText: "Instagram",
                                   hintText: "@..",
                                   controller: _instagramController,
                                   icon: Icon(FontAwesomeIcons.instagram,color: rosaPaula),
                                   mascara: [mascaraInstagram],
                                   onSaved: (String value) {
                                     _cliente.instagram = value;
                                   },
                                   validator: _validarInstagram,
                                 ),
                                 //Email
                                 TextFieldFormularioTop(
                                   keyboardType: TextInputType.emailAddress,
                                   labelText: "E-mail",
                                   hintText: "Digite seu e-mail..",
                                   controller: _emailController,
                                   icon: Icon(FontAwesomeIcons.at,color: rosaPaula),
                                   onSaved: (String value) {
                                     _cliente.email = value;
                                   },
                                   validator: _validarEmail,
                                 ),
                                 //Atividade
                                 TextFieldFormularioTop(
                                   keyboardType: TextInputType.text,
                                   labelText: "Atividade",
                                   hintText: "Digite seu ramo de atividade..",
                                   controller: _atividadeController,
                                   icon: Icon(FontAwesomeIcons.briefcase,color: rosaPaula),
                                   onSaved: (String value) {
                                     _cliente.atividade = value;
                                   },
                                   validator: _validarAtividade,
                                 ),
                                 //CPF
                                 TextFieldFormularioTop(
                                   keyboardType: TextInputType.number,
                                   labelText: "CPF",
                                   hintText: "Digite seu CPF..",
                                   controller: _cpfController,
                                   icon: Icon(FontAwesomeIcons.idCard,color: rosaPaula),
                                   mascara: [mascaraCPF],
                                   onSaved: (String value) {
                                     _cliente.cpf = value;
                                   },
                                   validator: _validarCPF,
                                 ),
                                 //Endereço
                                 TextFieldFormularioTop(
                                   keyboardType: TextInputType.text,
                                   labelText: "Endereço",
                                   hintText: "Digite seu endereço..",
                                   controller: _enderecoController,
                                   icon: Icon(FontAwesomeIcons.mapMarkerAlt,color: rosaPaula),
                                   onSaved: (String value) {
                                     _cliente.endereco = value;
                                   },
                                   validator: _validarEndereco,
                                 ),
                                 //Como nos conheceu
                                 TextFieldFormularioTop(
                                   keyboardType: TextInputType.text,
                                   labelText: "Como nos conheceu",
                                   hintText: "Digite como nos conheceu..",
                                   controller: _comoconheceuController,
                                   icon: Icon(FontAwesomeIcons.questionCircle,color: rosaPaula),
                                   onSaved: (String value) {
                                     _cliente.comoConheceu = value;
                                   },
                                   validator: _validarComoConheceu
                                 )
                               ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  //TRATAMENTOS A SEREM FEITOS
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomDropdown(
                          label: "Tratamentos a serem feitos",
                          onPressed: () {
                            setState(() {
                              _infoTratamento = !_infoTratamento;
                            });
                          },
                          icon: _infoTratamento ? FontAwesomeIcons.chevronDown: FontAwesomeIcons.chevronRight),
                      _infoTratamento
                          ? Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  child: SizedBox(
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
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                //DATA PICKER
                                Padding(
                                  padding: EdgeInsets.only(right: 30, left: 30),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5.0)),
                                    elevation: 4.0,
                                    onPressed: () {
                                      DatePicker.showDatePicker(
                                        context,
                                        theme: DatePickerTheme(containerHeight: 210.0),
                                        showTitleActions: true,
                                        locale: LocaleType.pt,
                                        minTime: DateTime(2019, 1, 1),
                                        maxTime: DateTime(2022, 12, 31),
                                        onConfirm: (date) {
                                          print('confirm $date');
                                          setState(() {
                                            _dataAgendamento =' ${date.day} / ${date.month} / ${date.year}';
                                          });
                                        },
                                        // currentTime: DateTime.now(), locale: LocaleType.en
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50.0,
                                      child: Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.date_range,size: 18.0,color: rosaPaula),
                                                    Text(
                                                      _dataAgendamento,
                                                      style: TextStyle(
                                                          color: rosaPaula,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                      CustomDropdown(
                          label: "Avaliação",
                          onPressed: () {
                            setState(() {
                              _infoAvaliacao = !_infoAvaliacao;
                            });
                          },
                          icon: _infoAvaliacao ? FontAwesomeIcons.chevronDown: FontAwesomeIcons.chevronRight),
                      _infoAvaliacao
                          ? Column(
                              children: <Widget>[
                                //Primeira Pergunta
                                Padding(
                                    padding:EdgeInsets.only(right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Esta em tratamento médico?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta1 =
                                                      !resultadoPergunta1;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta1),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta1
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p1Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Segunda Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Tem alergia?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta2 =
                                                      !resultadoPergunta2;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta2),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta2
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p2Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Terceira Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Fez cirurgia recentemente?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta3 =
                                                      !resultadoPergunta3;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta3),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta3
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p3Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Quarta pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Tem cicatriz facil?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta4 =
                                                      !resultadoPergunta4;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta4),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta4
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p4Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Quinta Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Há marcas de expressão facial?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta5 =
                                                      !resultadoPergunta5;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta5),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta5
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p5Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Sexta Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Tem diabetes?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta6 =
                                                      !resultadoPergunta6;
                                                });
                                              },
                                              behavior: HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta6),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta6
                                            ? TextFieldFormulario(
                                                keyboardType: TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p6Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Setima Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Tem quelóide?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta7 =
                                                      !resultadoPergunta7;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta7),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta7
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p7Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Oitava Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• É gestante?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta8 =
                                                      !resultadoPergunta8;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta8),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta8
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p8Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Nona Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Está em tratamento de HIV?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta9 =
                                                      !resultadoPergunta9;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta9),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta9
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p9Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Decima pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Tem hipo/hipertensão arterial?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta10 =
                                                      !resultadoPergunta10;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta10),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta10
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p10Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Decima primeira Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Está utilizando ácidos?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta11 =
                                                      !resultadoPergunta11;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta11),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta11
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p11Controller,
                                              )
                                            : Container()
                                      ],
                                    )),
                                //Decima segunda Pergunta
                                Padding(
                                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.stretch,
                                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "• Existe algum problema que julgue ser necessário informar ao profissional?",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 3,
                                            )),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  resultadoPergunta12 =
                                                      !resultadoPergunta12;
                                                });
                                              },
                                              behavior:HitTestBehavior.translucent,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.center,
                                                children: <Widget>[
                                                  SwitchlikeCheckbox(checked:resultadoPergunta12),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        resultadoPergunta12
                                            ? TextFieldFormulario(
                                                keyboardType:TextInputType.text,
                                                labelText: "Especifique: ",
                                                hintText: "Especifique..",
                                                controller: _p12Controller,
                                              )
                                            : Container()
                                      ],
                                    ))
                              ],
                            )
                          : Container()
                    ],
                  ),
                  //AUTORIZAÇÃO
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomDropdown(
                          label: "Tratamentos a serem feitos",
                          onPressed: () {
                            setState(() {
                              _infoAutorizacao = !_infoAutorizacao;
                            });
                          },
                          icon: _infoAutorizacao ? FontAwesomeIcons.chevronDown: FontAwesomeIcons.chevronRight),
                      _infoAutorizacao
                          ? Column(
                              children: <Widget>[
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 30, left: 30),
                                    child: Column(
                                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                                child: AutoSizeText(
                                              "Eu, " +
                                                  _nomeController.text +
                                                  ", CPF: " +
                                                  _cpfController.text +
                                                  " autorizo a realização do procedimento de micropigmentação \n \n"
                                                      "Autorizo o registro fotográfico do “antes” e “depois”, para documentação e divulgação da profissional. \n \n"
                                                      "Confirmo que as declarações acima são verdadeiras, não cabendo ao profissional a responsabilidade por informações omitidas nesta avaliação. \n \n"
                                                      "Me comprometo a seguir todos os cuidados necessários após o procedimento.",
                                              style: TextStyle(fontSize: 20),
                                              maxLines: 20,
                                            )),
                                          ],
                                        ),
                                        // Bloco pra assinatura
                                        Padding(
                                          padding: EdgeInsets.only(top: 10, right: 00, left: 00),
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5.0)),
                                            elevation: 4.0,
                                            onPressed: () {
                                              DatePicker.showDatePicker(
                                                context,
                                                theme: DatePickerTheme(containerHeight: 210.0),
                                                showTitleActions: true,
                                                locale: LocaleType.pt,
                                                minTime: DateTime(2019, 1, 1),
                                                maxTime: DateTime(2022, 12, 31),
                                                onConfirm: (date) {
                                                  print('confirm $date');
                                                  setState(() {
                                                    _dataAssinatura =" Em ${date.day} / ${date.month} / ${date.year} ";
                                                    _signatureController.clear();
                                                    _visualizarAssinatura = true;
                                                    _assinaturaFeita = false;
                                                  });
                                                },
                                                // currentTime: DateTime.now(), locale: LocaleType.en
                                              );
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 50.0,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(Icons.date_range,size: 18.0,color: rosaPaula),
                                                            Text(
                                                              _dataAssinatura,
                                                              style: TextStyle(
                                                                  color:rosaPaula,
                                                                  fontWeight:FontWeight.bold,
                                                                  fontSize:20.0
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    "  ASSINAR",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:FontWeight.bold,
                                                        fontSize: 18.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                        _assinaturaFeita
                                            ? Padding(
                                                padding:EdgeInsets.only(top: 10),
                                                child: Image.memory(data),
                                              )
                                            : Container(),
                                        _visualizarAssinatura
                                            ? Center(
                                                child: Signature(
                                                  controller:_signatureController,
                                                  height: 200,
                                                  backgroundColor:Colors.grey[200],
                                                ),
                                              )
                                            : Container(),
                                        _visualizarAssinatura
                                            ? Container(
                                                decoration: BoxDecoration( color: Colors.lightGreen),
                                                child: Row(
                                                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                                  mainAxisSize:MainAxisSize.max,
                                                  children: <Widget>[
                                                    IconButton(
                                                      icon: const Icon(Icons.check),
                                                      color: Colors.white,
                                                      onPressed: () async {
                                                        if (_signatureController.isNotEmpty) {
                                                          data = await _signatureController.toPngBytes();
                                                          setState(() {
                                                            _assinaturaFeita =!_assinaturaFeita;
                                                            _visualizarAssinatura =!_visualizarAssinatura;
                                                          });
                                                        }
                                                      },
                                                    )
                                                  ],
                                                ),
                                              )
                                            : Container()
                                      ],
                                    ))
                              ],
                            )
                          : Container()
                    ],
                  ),
                  //SALVAR E VALIDAR
                  CustomButton(
                    label: "Finalizar",
                    onPressed: _validarCampos
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
