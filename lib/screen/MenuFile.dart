import 'package:flutter/material.dart';
import 'package:hohaya/screen/PublicationCategorie.dart';

class MenuFile extends StatefulWidget {
  @override
  _MenuFileState createState() => _MenuFileState();
}

class _MenuFileState extends State<MenuFile> {
  String _connexionBtn = "Connexion";
  Color _loginBtnColor = Colors.blue;
  int i = 0;

  void changeLoginBtnText() {
    setState(() {
      if (_connexionBtn == "Connexion") {
        _loginBtnColor = Colors.grey;
        _connexionBtn = "Deconnexion";
      } else {
        _loginBtnColor = Colors.grey;
        _connexionBtn = "Connexion";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 20),
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
            ),
            accountName: Text("User Name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
            accountEmail: Text(
              "usermail@gmail.com",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/2.jpg"))),
          ),
          Center(
            child: RaisedButton(
              child: Text(
                "$_connexionBtn",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              onPressed: changeLoginBtnText,
              disabledColor: _loginBtnColor,
            ),
          ),
          ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(PublicationCategorie.tagNull);
              },
              leading: InkWell(child: Icon(Icons.publish)),
              title: Text("Publications",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ))),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(PublicationCategorie.tag0);
                },
                leading: Icon(Icons.airline_seat_individual_suite),
                title: Text("Chambres",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(PublicationCategorie.tag1);
                },
                leading: Icon(Icons.business),
                title: Text("Appartements",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(PublicationCategorie.tag2);
                },
                leading: Icon(Icons.home),
                title: Text("Résidences",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ))),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text("Mes Réservations"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.account_box),
            title: Text("Mon Compte"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Paramètres"),
          )
        ],
      ),
    );
  }
}