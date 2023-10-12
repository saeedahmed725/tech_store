import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/constants/app_image_assets.dart';
import '../widget/custom_grid_view.dart';
import '../widget/home_tab_bar.dart';
import '../widget/search_field.dart';
import '../widget/white_friday_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: SvgPicture.asset(
            AppImageAssets.logo,
            height: 35,
            color: Colors.black,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SearchField(),
            const WhiteFridayCard(),
            HomeTabBar(
                selectedIndex: selectedIndex,
                onTap: (index) => setState(() => selectedIndex = index)),
            const CustomGridView()
          ],
        ),
      ),
    );
  }
}
