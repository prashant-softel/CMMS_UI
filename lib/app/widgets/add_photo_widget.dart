import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(.3),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 90,
            width: 130,
            child: Icon(
              Icons.photo,
              size: 30,
            ),
          ),
          Container(
            height: 30,
            width: 130,
            margin: Dimens.edgeInsets2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
              color: Colors.black54,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                  size: 20,
                ),
                Dimens.boxWidth4,
                Text(
                  'Add Photos',
                  style: Styles.white12.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
