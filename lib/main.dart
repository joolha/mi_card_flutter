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
      expandedValue: 'This is item number',
    ),
    Item(
      headerIcon: Icons.favorite,
      headerValue: 'No que eu acredito?',
      expandedValue: 'This is item number',
    ),
    Item(
      headerIcon: Icons.star_rate,
      headerValue: 'Qual a minha aspiração?',
      expandedValue: 'This is item number\nAnotherline',
    ),
    Item(
      headerIcon: Icons.extension,
      headerValue: 'Qual o meu propósito?',
      expandedValue: 'This is item number',
    ),
    Item(
      headerIcon: Icons.lightbulb,
      headerValue: 'Oportunidade',
      expandedValue: 'This is item number',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
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
                  color: Colors.lightBlue.shade100,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.lightBlue.shade100,
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
                  color: Colors.lightBlue,
              ),
              title: Text(
                item.headerValue,
                style: TextStyle(
                  color: Colors.lightBlue.shade900,
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
                  color: Colors.lightBlue.shade700,
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
