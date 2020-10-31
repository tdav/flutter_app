import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'account.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Text("Header"));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.card_travel, "Заказы", SettingsScreen.routeName),
      getNavItem(Icons.redeem, "Акции", SettingsScreen.routeName),
      getNavItem(Icons.shopping_cart, "Корзина", SettingsScreen.routeName),
      getNavItem(Icons.dns, "Категории", SettingsScreen.routeName),
      getNavItem(Icons.thumb_up, "Бренды", SettingsScreen.routeName),
      getNavItem(Icons.business, "Поставщики", SettingsScreen.routeName),
      getNavItem(Icons.grade, "Избранное", SettingsScreen.routeName),
      getNavItem(Icons.how_to_reg, "Мой профиль", AccountScreen.routeName),
      getNavItem(Icons.build, "Тех. поддержка", SettingsScreen.routeName),
      getNavItem(
          Icons.contact_support, "О приложения", SettingsScreen.routeName),
      getNavItem(Icons.lock, "Выход", SettingsScreen.routeName),
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(),
      body: Container(
          child: Center(
        child: Text("Home Screen"),
      )),
      drawer: getNavDrawer(context),
      bottomNavigationBar: _buildOriginDesign(),
    );
  }

  Widget _buildOriginDesign() {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Color(0xff0c18fb),
      strokeColor: Color(0x300c18fb),
      unSelectedColor: Colors.grey[600],
      backgroundColor: Colors.white,
      // borderRadius: Radius.circular(20.0),
      items: [
        CustomNavigationBarItem(
          icon: AntDesign.home,
        ),
        CustomNavigationBarItem(
          icon: AntDesign.shoppingcart,
        ),
        CustomNavigationBarItem(
          icon: AntDesign.cloudo,
        ),
        CustomNavigationBarItem(
          icon: AntDesign.search1,
        ),
        CustomNavigationBarItem(
          icon: AntDesign.user,
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      isFloating: false,
    );
  }
}
