// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../view_model/auth_services.dart';
import '../../view_model/image_services.dart';

class ImageProfileAdd extends StatelessWidget {
  const ImageProfileAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<AddRecipiAuth>(context, listen: true)
            .imgstring
            .isNotEmpty
        ? Consumer<ImageProviderReceipi>(
            builder: (context, value, child) {
              return GestureDetector(
                  onTap: () {
                    context
                        .read<ImageProviderReceipi>()
                        .showBottomSheet(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        image: DecorationImage(
                          image: MemoryImage(
                            const Base64Decoder().convert(
                              context.read<AddRecipiAuth>().imgstring,
                            ),
                          ),
                          fit: BoxFit.cover,
                        )),
                  ));
            },
          )
        : GestureDetector(
            onTap: () {
              context.read<ImageProviderReceipi>().showBottomSheet(context);
            },
            child: CircleAvatar(
              backgroundColor: kTeal,
              radius: 80,
              child: Image.asset(
                "assets/food/login_food1.png",
              ),
            ),
          );
  }
}
