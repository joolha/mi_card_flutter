import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class Item {
  Item({
    this.expandedValue,
    this.headerIcon,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  IconData headerIcon;
  String headerValue;
  bool isExpanded;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Item> _data = [
    Item(
      headerIcon: Icons.fingerprint,
      headerValue: 'Quem eu sou?',
      expandedValue: 'Oi, eu sou a Julia! :)\n Cursando Gestão de MKT em Mídias Digitais\nMãe de pet\nDisney Girl\nModa, filmes, desenhar, gadgets e minha casa',
    ),
    Item(
      headerIcon: Icons.favorite,
      headerValue: 'No que eu acredito',
      expandedValue: 'Nós construímos nosso caminho\nDedicação\nAmor\nPropósito',
    ),
    Item(
      headerIcon: Icons.star_rate,
      headerValue: 'Minha aspiração',
      expandedValue: 'Independência\nReconhecimento\nRealização',
    ),
    Item(
      headerIcon: Icons.extension,
      headerValue: 'Meu propósito',
      expandedValue: '?\n Ikigai 生き甲斐 ',
    ),
    Item(
      headerIcon: Icons.lightbulb,
      headerValue: 'Oportunidade',
      expandedValue: 'Esta é a oportunidade que me permitirá descobrir meu propósito e alcançar minhas aspirações, através de quem eu sou e do que eu acredito.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purpleAccent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/julia.jpg'),
                ),
                Text(
                  'Julia Romanow',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  'ASPIRANTE À ESTAGIÁRIA',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.purple.shade100,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.purple.shade100,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  child: _buildPanel(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      animationDuration: Duration(milliseconds: 600),
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.all(2.0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data.forEach((element) {element.isExpanded = false;});
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(
                  item.headerIcon,
                  color: Colors.purple,
              ),
              title: Text(
                item.headerValue,
                style: TextStyle(
                  color: Colors.purple.shade900,
                  fontFamily: 'SourceSansPro',
                  fontSize: 22.0,
                ),
              ),
            );
          },
          body: ListTile(
              title: Text(
                item.expandedValue,
                style: TextStyle(
                  color: Colors.purple.shade700,
                  fontFamily: 'SourceSansPro',
                  fontSize: 18.0,
                ),
              ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
