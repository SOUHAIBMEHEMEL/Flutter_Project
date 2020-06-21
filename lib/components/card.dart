import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'icon_text.dart';

//const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

enum CardDemoType {
  standard,
  tappable,
  selectable,
}

class TravelDestination {
  const TravelDestination({
    @required this.assetName,
   // @required this.assetPackage,
    @required this.title,
    @required this.description,
    @required this.city,
    @required this.location,
    this.type = CardDemoType.standard,
  }) : assert(assetName != null),
       //assert(assetPackage != null),
       assert(title != null),
       assert(description != null),
       assert(city != null),
       assert(location != null);

  final String assetName;
  //final String assetPackage;
  final String title;
  final String description;
  final String city;
  final String location;
  final CardDemoType type;
}

const List<TravelDestination> destinations = <TravelDestination>[
  TravelDestination(
    assetName: 'assets/images/china.jpg',
    //assetPackage: _kGalleryAssetsPackage,
    title: 'Top 10 Cities to Visit in Tamil Nadu',
    description: 'Number 10',
    city: 'Thanjavur',
    location: 'Thanjavur, Tamil Nadu',
  ),
];

class TravelDestinationItem extends StatelessWidget {
  const TravelDestinationItem({ Key key, @required this.destination, this.shape })
    : assert(destination != null),
      super(key: key);

  // This height will allow for all the Card's content to fit comfortably within the card.
  static const double height = 320.0;
  final TravelDestination destination;
  final ShapeBorder shape;

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height,
              child: Card(
                // This ensures that the Card's children are clipped correctly.
                clipBehavior: Clip.antiAlias,
                shape: shape,
                child: TravelDestinationContent(destination: destination),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TravelDestinationContent extends StatelessWidget {
  const TravelDestinationContent({ Key key, @required this.destination })
    : assert(destination != null),
      super(key: key);

  final TravelDestination destination;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subtitle1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Photo.
        SizedBox(
          height: 180.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                // In order to have the ink splash appear above the image, you
                // must use Ink.image. This allows the image to be painted as part
                // of the Material and display ink effects above it. Using a
                // standard Image will obscure the ink splash.
                child: Ink.image(
                  image: AssetImage(destinations[0].assetName,),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
        
        // Description and share/explore buttons.
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                // three line description
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    destination.description,
                    style: descriptionStyle.copyWith(color: Colors.red),
                  ),
                ),
                Text(destination.location),
              ],
            ),
          ),
        ),
        if (destination.type == CardDemoType.standard)
          // share, explore buttons
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: IconText(tStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icons.location_on, text: "Live", color: Colors.white, ccolor: Colors.red,)),
              Container(height: 30,width: 1,color: Colors.grey,),
              Expanded(child: IconText(tStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icons.location_on, text: "Photo", color: Colors.white, ccolor: Colors.greenAccent,)),
              Container(height: 25,width: 1,color: Colors.grey,),
              Expanded(child: IconText(tStyle: TextStyle(fontWeight: FontWeight.bold), icon: Icons.location_on, text: "Live", color: Colors.white, ccolor: Colors.pink,)),
            ],
          ),
      ],
    );
  }
}

class CardsDemo extends StatefulWidget {
  static const String routeName = '/material/cards';

  @override
  _CardsDemoState createState() => _CardsDemoState();
}

class _CardsDemoState extends State<CardsDemo> {
  ShapeBorder _shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: TravelDestinationItem(destination: destinations[0], shape: _shape),
    );
  }
}


