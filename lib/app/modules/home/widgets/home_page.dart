import 'package:bankinspace/app/modules/login/widgets/login_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.black ,

              title: Text('Autorizar Notificações?',
                        style: TextStyle(color: Colors.white,)),

              content: Text('Este aplicativo precisa de autorização para lhe mostrar notificações',
                        style: TextStyle(color: Colors.white,)),

              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Não',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: Text(
                    'Sim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/jex.jpg"), fit: BoxFit.cover),
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Image.asset("assets/images/logo.png",
                fit: BoxFit.cover, height: 400, width: 400),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(3.0),
                width: 60,
                height: 80,
                child: Text(
                  'Bem Vindo ao DevInSpace Bank!',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Righteous',
                      fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(3.0),
                width: 60,
                height: 80,
                child: Text(
                  'O seu Bank perto de você.',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Righteous',
                      fontSize: 30),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(fontFamily: 'Righteous', fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.white,
                    fixedSize: Size(250, 70),
                    elevation: 5),
                onPressed: () {
                  Get.to(LoginPageState());
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
          ],
        ),
      ),
    );
  }
}
