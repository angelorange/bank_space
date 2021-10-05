import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final Color color;
  final String text;
  final IconData iconData;

  const ButtonText({
    Key? key,
    this.color = Colors.grey,
    this.text = "",
    this.iconData = Icons.whatshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("tapped porra");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(3.0, 5.0),
                    blurRadius: 7),
              ]),
          width: double.infinity,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 1, child: Icon(iconData, color: Colors.white)),
              Expanded(
                flex: 2,
                child: Text("Login",
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Righteous')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
