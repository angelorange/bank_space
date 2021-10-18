import 'package:bankinspace/app/data/models/user_model.dart';
import 'package:bankinspace/app/data/models/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:bankinspace/app/modules/personal_page/widgets/personal_wallet.dart';
import 'package:get/get.dart';
import 'package:bankinspace/app/modules/home/widgets/home_page.dart';

class HomeWithSidebar extends StatelessWidget {

  final User user;
  final Wallet wallet;

  const HomeWithSidebar(this.user, this.wallet);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeWithSidebar(this.user, this.wallet),
    );
  }
}

class homeWithSidebar extends StatefulWidget {

  final User user;
  final Wallet wallet;

  const homeWithSidebar(this.user, this.wallet);

  @override
  _homeWithSidebarState createState() => _homeWithSidebarState(this.user, this.wallet);
}

class _homeWithSidebarState extends State<homeWithSidebar>
    with TickerProviderStateMixin {

  final User user;
  final Wallet wallet;

  _homeWithSidebarState(this.user, this.wallet);


  
  bool sideBarActive = false;
  AnimationController? rotationController;
  
  @override
  void initState() {
    // TODO: implement initState

    rotationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4b0082),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/bg3.jpg'),
                                    fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                        color: Colors.white),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xfff1f3f6),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/avatar4.png'),
                                    fit: BoxFit.contain)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.username,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                              Text(
                                user.fullname,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(child: navigatorTitle("Home", true,), onTap: () {
                      Get.to(() => HomePage());
                    },),
                    InkWell(child: navigatorTitle("Profile", false,), onTap: () {

                    },),
                    InkWell(child: navigatorTitle("Transactions", false), onTap: () {

                    },),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      size: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => HomePage());
                      },
                      child: Text(
                        "Logout",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Ver 2.0.1",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: (sideBarActive) ? MediaQuery.of(context).size.width * 0.6 : 0,
            top: (sideBarActive) ? MediaQuery.of(context).size.height * 0.2 : 0,
            child: RotationTransition(
              turns: (sideBarActive)
                  ? Tween(begin: -0.05, end: 0.0).animate(rotationController!)
                  : Tween(begin: 0.0, end: -0.05).animate(rotationController!),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: (sideBarActive)
                    ? MediaQuery.of(context).size.height * 0.7
                    : MediaQuery.of(context).size.height,
                width: (sideBarActive)
                    ? MediaQuery.of(context).size.width * 0.8
                    : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: personalWallet(wallet),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: (sideBarActive)
                ? IconButton(
                    padding: EdgeInsets.all(30),
                    onPressed: closeSideBar,
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                : IconButton(
                    padding: EdgeInsets.all(30),
                    onPressed: openSideBar,
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                  
          )
        ],
      ),
    );
  }

  Row navigatorTitle(String name, bool isSelected) {
    return Row(
      children: [
        (isSelected)
            ? Container(
                width: 5,
                height: 60,
                color: Color(0xffadff2f),
              )
            : Container(
                width: 5,
                height: 60,
              ),
        SizedBox(
          width: 10,
          height: 60,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 16,
              fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w400, color: Colors.white),
        )
      ],
    );
  }

  void closeSideBar() {
    sideBarActive = false;
    setState(() {});
  }

  void openSideBar() {
    sideBarActive = true;
    setState(() {});
  }
}