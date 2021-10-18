import 'package:bankinspace/app/data/models/wallet_model.dart';
import 'package:flutter/material.dart';

class PersonalWallet extends StatelessWidget {

  final Wallet wallet;
  const PersonalWallet(this.wallet);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: personalWallet(this.wallet),
    );
  }
}

class personalWallet extends StatefulWidget {
  final Wallet wallet;
  const personalWallet(this.wallet);
  
  @override
  _personalWalletState createState() => _personalWalletState(this.wallet);
}

class _personalWalletState extends State<personalWallet> {


  final Wallet wallet;
  _personalWalletState(this.wallet);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      )),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "eWallet",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ubuntu',
                          fontSize: 25),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Meu Saldo",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'avenir',color: Colors.white),
            ),
            
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black,
                border: Border.all(color: Color(0xffadff2f))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (wallet.amount * 2).toString(),
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Saldo em R\$",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                      SizedBox(height: 20,),
                                            Text(
                        wallet.amount.toString(),
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      Text(
                        "Saldo em OC\$",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffadff2f)),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ultimas Transferências",
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'avenir', color: Colors.white),
                ),
                Container(
                  height: 60,
                  width: 60,)
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffadff2f),
                     
              
                    ),
                    child: Icon(
                      Icons.add,
                      size: 40,
                    ),
                  ),
                  avatarWidget("avatar1", "Mike"),
                  avatarWidget("avatar2", "Joseph"),
                  avatarWidget("avatar3", "Ashley"),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   'Serviços',
                   style: TextStyle(
                       fontSize: 21,
                       fontWeight: FontWeight.w800,
                       fontFamily: 'avenir', color: Colors.white,)
                 ),
                 
                 Container(
                   height: 30,
                   width: 30,
                   child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xffadff2f)),
                    child: TextButton(
                      child: Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.black
                      ),
                    onPressed: 
                      () => showDialog<String>(
                        context: context,
                        builder: 
                          (BuildContext context) => AlertDialog(

                            backgroundColor: Colors.black ,
                            title: const Text('Serviços'),
                            content: 
                              GridView.count(
                                crossAxisCount: 4,
                                childAspectRatio: 0.7,
                                children: [
                                  serviceWidget("sendMoney", "Enviar Cripto"),
                                  serviceWidget("receiveMoney", "Receber Cripto"),
                                ]
                            ),
                                            
                            actions: 
                              <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'Cancel'),
                                  child: const Text('Voltar'),
                                ),
                              ],

                          ),
                      ),
                                      ),
                  )
                 )
               ],
             ),

          ],
        ),
      ),
    );
  }

   Column serviceWidget(String img, String name) {

     var icon;
     if (img == "receiveMoney") {

        icon = Icon(
            Icons.monetization_on,
            size: 20,
            color: Colors.white,
          );


      }

      if (img == "sendMoney") {

        icon = Icon(
            Icons.monetization_on_outlined,
            size: 20,
            color: Colors.white,
          );


      }

      

     return Column(
       children: [
         Expanded(
           child: InkWell(
             onTap: () {},
             child: Container(
               margin: EdgeInsets.all(4),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(20)),
                 color: Colors.black,
                 border: Border.all(color: Color(0xffadff2f))
               ),
               child: Center(
                 child: icon
               ),
             ),
           ),
         ),
         SizedBox(
           height: 5,
         ),
         Text(
           name,
           style: TextStyle(
             fontFamily: 'avenir',
             fontSize: 14,
             color: Colors.white,
           ),
           textAlign: TextAlign.center,
         )
       ],
     );
   }

  Container avatarWidget(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 80,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.black,
                border: Border.all(color: Color(0xffadff2f))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 60,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700),
          ),
          
        ],
      ),
    );
  }
}