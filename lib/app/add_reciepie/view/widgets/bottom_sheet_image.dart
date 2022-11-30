import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wit_task/app/add_reciepie/view_model/image_services.dart';
import 'package:wit_task/constants/colors.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: kPrimary,
      child: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Column(children: [
          Text(
            'choose Camera or Gallery',
            style: TextStyle(
              color: kWhite,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<ImageProviderReceipi>().takecamera(context);
                },
                icon: Icon(
                  Icons.camera_front_outlined,
                  color: kWhite,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<ImageProviderReceipi>().takePhoto(context);
                },
                icon: Icon(
                  Icons.image_rounded,
                  color: kWhite,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
