import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 500);
    path.lineTo(320,500);
    path.lineTo(320, 210);
    path.lineTo(0,270);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CardTemplate extends StatelessWidget {
  String name = "Daenerys Targaryen";
  String title = "Mother of Dragons";
  String family = "House Targaryen";
  String familyImage = "assets/img/House Targaryen.webp";
  String imageUrl = "https://thronesapi.com/assets/images/daenerys.jpg";

  CardTemplate(this.name, this.title, this.family, this.imageUrl) {
    familyImage = "assets/img/$family.webp";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 150,
        child: SizedBox(
          width: 320,
          height: 500,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(familyImage),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).cardColor,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 130,
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Theme.of(context).cardColor,
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          name,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Center(
                        child: Text(
                          family,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}