import 'package:beautydesign/screens/CadastroCliente.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navegar extends StatefulWidget {
  @override
  _NavegarState createState() => _NavegarState();
}

class _NavegarState extends State<Navegar> {

  int _currentIndex = 0;
  PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  //Variáveis iniciais
  Color rosaPaula = Color(0xffFA879E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white,
            opacity: 1
        ),
        backgroundColor: rosaPaula,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("PAULA BEAUTY DESIGN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            //Icon(Icons.assessment),
            /*Text("BEAUTY DESIGN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),*/
          ],
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          children: <Widget>[
            CadastroCliente(),
            Text("TELA 2"),
            Text("TELA 3"),
            Text("TELA 4"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index){
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text("Novo Cliente"),
              icon: Icon(FontAwesomeIcons.userPlus),
              activeColor: rosaPaula
          ),
          BottomNavyBarItem(
            title: Text("Consulta Cliente"),
            icon: Icon(FontAwesomeIcons.search),
            activeColor: rosaPaula,
          ),
          BottomNavyBarItem(
              title: Text("Edição Cliente"),
              icon: Icon(FontAwesomeIcons.userEdit),
              activeColor: rosaPaula,
          ),
          BottomNavyBarItem(
              title: Text("Estatísticas"),
              icon: Icon(FontAwesomeIcons.chartLine),
              activeColor: rosaPaula
          ),
        ],
      ),

    );
  }
}
