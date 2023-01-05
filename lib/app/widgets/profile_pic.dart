import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmms/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.onPress,
    required this.imageUrl,
  }) : super(key: key);

  final Function()? onPress;
  final String imageUrl;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              padding: Dimens.edgeInsets2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).secondaryHeaderColor,
                  width: 2,
                ),
              ),
              child: Container(
                height: Dimens.hundred,
                width: Dimens.ninty,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // border: Border.all(
                  //   color: Theme.of(context).primaryColor,
                  // ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            placeholder: (ctx, _) => Shimmer.fromColors(
              baseColor: Theme.of(context).dividerColor,
              highlightColor: Theme.of(context).highlightColor,
              child: Container(
                padding: Dimens.edgeInsets12,
                height: Dimens.hundred,
                width: Dimens.ninty,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                child: SvgPicture.asset(AssetConstants.profileClipart),
              ),
            ),
            errorWidget: (context, _, dynamic val) => Container(
              padding: Dimens.edgeInsets12,
              height: Dimens.hundred,
              width: Dimens.ninty,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              child: SvgPicture.asset(AssetConstants.profileClipart),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: GestureDetector(
              onTap: onPress,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                padding: Dimens.edgeInsets5,
                child: SvgPicture.asset(
                  AssetConstants.editClipart,
                  height: Dimens.twelve,
                ),
              ),
            ),
          )
        ],
      );
}
