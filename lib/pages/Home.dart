import 'package:flutter/material.dart';


class Home extends StatefulWidget
{
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {


  final cardA = Card(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0) ),
      elevation: 3,
      color: Colors.blue,
      child: Container(
          child: Column(
              children: <Widget>[

                const ListTile(
                  contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  title: Text( 'The Enchanted Nightingale', style: TextStyle( color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold ) ),
                  subtitle: Text( 'Music by Julie Gable. Lyrics by Sidney Stein.', style: TextStyle( color: Colors.white, fontSize: 18 ) ),
                ),

              ]
          )
      )
  );



  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: _buildCarousel(context, 1),
    );
  }




  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 15.0),
        Text('Carousel $carouselIndex'),
        SizedBox(height: 15.0),
        cardA,
        SizedBox(height: 15.0),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }




}
