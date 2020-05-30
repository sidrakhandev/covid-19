import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
      backgroundColor:Colors.blueGrey[900],
       title: Text('COVID-19 TRACKER'),
      ),
       body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 130,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ]),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              countryData[index]['country'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                              countryData[index]['countryInfo']['flag'],
                              height: 70,
                              width: 70,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                          
                              child: Column(
                                
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('CONFIRMED' +'   '+
                              countryData[index]['cases'].toString(),style:TextStyle( color:Colors.red,fontWeight: FontWeight.bold,fontSize: 15)),
                          Text('ACTIVE' +'   '+
                              countryData[index]['active'].toString(),style:TextStyle( color:Colors.yellow[900],fontWeight: FontWeight.bold,fontSize: 15)),
                          Text('RECOVERED' +'   '+
                              countryData[index]['recovered'].toString(),
                              style:TextStyle( color:Colors.green[700],fontWeight: FontWeight.bold,fontSize: 15)),
                          Text('DEATHS' +'   '+
                              countryData[index]['deaths'].toString(),
                              style:TextStyle( color:Colors.red[900],fontWeight: FontWeight.bold,fontSize: 15)),
                        ],
                      )))
                    ],
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            )
    );
  }
  }

