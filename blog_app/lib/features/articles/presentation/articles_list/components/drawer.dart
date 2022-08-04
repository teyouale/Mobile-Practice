import 'package:blog_app/features/articles/presentation/articles_list/articles.dart';
import 'package:blog_app/features/auth/presentation/pages/index.dart';
import 'package:blog_app/features/profile/presentation/pages/profiles.dart';
import 'package:flutter/material.dart';

import '../../../utils/assets.dart';
import '../../../utils/colors.dart';
import '../../../utils/styles.dart';
import '../../add_edit_article/New_article.dart';
import 'circular_avatar.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  static const double paddingLeft = 32;

  final String imageUrl;
  final String fullName;
  final String email;
  final String profession;
  const CustomDrawer(
      {Key? key,
      required this.profession,
      required this.email,
      required this.fullName,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          profession: profession,
          imageUrl: imageUrl,
          title: fullName,
          email: email,
        ),
        const Expanded(child: Body()),
        const Footer()
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String email;
  final String profession;
  const Header(
      {Key? key,
      required this.profession,
      required this.email,
      required this.title,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(CustomDrawer.paddingLeft, 56, 0, 0),
      //color: CustomColors.drawerHeaderBkg,
      height: 256,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircularAvator(
            imageUrl: imageUrl,
            radius: 36,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(title, style: Styles.drawerTitleStyle),
          Text(profession, style: Styles.drawerSubtitleStyle),
          const SizedBox(
            height: 8,
          ),
          Text(email, style: Styles.drawerSubtitleStyle2)
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: CustomColors.drawerBodyBkg,
      child: Column(
        children: [
          DrawerTile(
              onPressed: () {
                Navigator.pushNamed(context, ProfilePage.routeName);
              },
              paddingLeft: CustomDrawer.paddingLeft,
              title: "Profile",
              assetPath: Assets.profile),
          DrawerTile(
            onPressed: () {},
            paddingLeft: CustomDrawer.paddingLeft,
            title: "Settings",
            assetPath: Assets.setting,
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: Colors.white,
          ),
          DrawerTile(
              onPressed: () {
                Navigator.pushNamed(context, ArticlesListPage.routeName);
              },
              paddingLeft: CustomDrawer.paddingLeft,
              title: "Articles",
              assetPath: Assets.articles),
          DrawerTile(
              onPressed: () {
                Navigator.pushNamed(context, AddArticlePage.routeName);
              },
              paddingLeft: CustomDrawer.paddingLeft,
              title: "Add Article",
              assetPath: Assets.articles)
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      color: CustomColors.drawerBodyBkg,
      child: DrawerTile(
          onPressed: () {
            Navigator.pushNamed(context, LoginPage.rounteName);
          },
          paddingLeft: CustomDrawer.paddingLeft,
          title: "Log Out",
          assetPath: Assets.logout),
    );
  }
}
