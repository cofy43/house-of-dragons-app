import 'package:flutter/material.dart';

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
    // TODO: implement build
    return Center(
      child: Card(
        elevation: 50,
        shadowColor: Colors.black26,
        child: SizedBox(
          width: 300,
          height: 520,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                ),
                SizedBox(
                  height: 100,
                  child: Center(
                    chig,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(familyImage),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}