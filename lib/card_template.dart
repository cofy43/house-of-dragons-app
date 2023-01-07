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
        elevation: 100,
        child: SizedBox(
          width: 280,
          height: 520,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                ),
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      name,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
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
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(

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