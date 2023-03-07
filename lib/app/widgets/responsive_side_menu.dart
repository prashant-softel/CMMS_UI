import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../theme/dimens.dart';
import 'side_menu_web.dart';

class ResponsiveSideMenu extends StatelessWidget {
  // final List<NavigationRailDestination> destinations;
  // final int selectedIndex;
  // final ValueChanged<int> onDestinationSelected;
  final Widget? mobileDrawerHeader;
  final Widget? webHeader;
  final Widget? mobileFooter;
  final Widget? webFooter;
  final Widget? mobileRailLabel;
  final Widget? webRailLabel;

  ResponsiveSideMenu({
    // required this.destinations,
    // required this.selectedIndex,
    // required this.onDestinationSelected,
    this.mobileDrawerHeader,
    this.webHeader,
    this.mobileFooter,
    this.webFooter,
    this.mobileRailLabel,
    this.webRailLabel,
  });

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? //
        SideMenuWeb()
        // NavigationRail(
        //     leading: webHeader,
        //     trailing: webFooter,
        //     selectedIndex: selectedIndex,
        //     onDestinationSelected: onDestinationSelected,
        //     labelType: NavigationRailLabelType.selected,
        //     destinations: destinations,
        //     //label: webRailLabel,
        //   )
        : Drawer(
            child: Column(
              children: [
                if (mobileDrawerHeader != null)
                  mobileDrawerHeader ?? Dimens.box0,
                Expanded(
                  child: //
                      ListView(
                    children: [
                      SideMenuWeb(),
                      // NavigationRail(
                      //   leading: mobileDrawerHeader,
                      //   trailing: mobileFooter,
                      //   selectedIndex: selectedIndex,
                      //   onDestinationSelected: onDestinationSelected,
                      //   labelType: NavigationRailLabelType.selected,
                      //   destinations: destinations,
                      //   //label: mobileRailLabel,
                      // ),
                    ],
                  ),
                ),
                if (mobileFooter != null) mobileFooter ?? Dimens.box0,
              ],
            ),
          );
  }
}
