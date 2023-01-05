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
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  child: CircleAvatar(
                    radius: 100,
                      backgroundImage: NetworkImage(
                        imageUrl,
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(familyImage),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Text(
                          name,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
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