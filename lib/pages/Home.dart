import 'package:flutter/material.dart';


class Home extends StatefulWidget
{
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {


  final List<Map<String, dynamic>> _listViewData = [
    {
      "title"  : "Titulo A",
      "content": "Conteudo A",
      "status" : "Atendimento",
      "date"   : "12/04/2017"
    },
    {
      "title"  : "Titulo B",
      "content": "Conteudo B",
      "status" : "Atendimento",
      "date"   : "12/04/2017"
    },
    {
      "title"  : "Titulo C",
      "content": "Conteudo C",
      "status" : "Atendimento",
      "date"   : "12/04/2017"
    },
    {
      "title"  : "Titulo D",
      "content": "Conteudo D",
      "status" : "Atendimento",
      "date"   : "12/04/2017"
    },
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('Carousel'),
          SizedBox(height: 15.0),
          SizedBox(
            // you may want to use an aspect ratio here for tablet support
            height: 100.0,
            child: PageView.builder(
              // store this controller in a State to save the carousel scroll position
              itemCount: _listViewData.length,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (BuildContext context, int itemIndex) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: _card( _listViewData[itemIndex] ),
                );
              },
            ),
          )
        ],
      ),
    );
  }


  Widget _card( Map<String, dynamic> item ) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),

      child: Row(
        children: <Widget>[

          Expanded(
            child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text( item['title'], style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold ) ),
                    Text( item['content'], style: TextStyle( color: Colors.white, fontSize: 16 ) ),

                  ],
                )
            ),
          ),

          Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[

                  Text( item['date'], style: TextStyle( color: Colors.white, fontSize: 16 ) ),

                ],
              )
          ),

        ],
      ),

    );
  }



}
