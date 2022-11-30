import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../routes/routes.dart';
import '../../../detail_screen/view/detail_screen.dart';

class HomeCardsWidgets extends StatelessWidget {
  const HomeCardsWidgets({
    Key? key,
    required this.foodName,
    required this.hour,
    required this.doc,
    required this.image,
    required this.description,
    required this.time,
  }) : super(key: key);

  final String foodName;
  final String hour;
  final String description;
  final String image;
  final String time;
  final QueryDocumentSnapshot<Object?> doc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutesProvider.nextScreen(
            screen: DetailScreen(
          incredents: doc["ingredientModel"],
          uid: doc.id,
          hours: hour,
          time: time,
          name: foodName,
          image: image,
          description: description,
        ));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                    child: Container(
                      height: constraints.maxHeight * 0.8,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 90,
                  child: Hero(
                    tag: foodName,
                    child: CircleAvatar(
                      backgroundColor: kWhite,
                      radius: 80,
                      backgroundImage: MemoryImage(
                        const Base64Decoder().convert(
                          image,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  // left: 20,
                  right: 40,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodName.toUpperCase(),
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            color: kWhite,
                          ),
                        ),
                        Text(
                          '$time : $hour',
                          style: TextStyle(
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
