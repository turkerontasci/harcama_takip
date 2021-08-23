import 'package:flutter/material.dart';
import 'package:harcama_takip/memberships/memberships.dart';
import 'package:harcama_takip/screens/membership_screen.dart';

class NewMembership extends StatefulWidget {
  @override
  _NewMembershipState createState() => _NewMembershipState();
}

class _NewMembershipState extends State<NewMembership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yeni Üyelik",
        ),
        toolbarHeight: 45.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              memberships.length,
              (index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 2,
                  borderRadius: BorderRadius.circular(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MemberShipScreen(
                            id: memberships[index]["id"],
                            title: memberships[index]["title"],
                            price: memberships[index]["price"],
                            image: memberships[index]["image"],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image:
                                        AssetImage(memberships[index]["image"]),
                                  )),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${memberships[index]["title"]}",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
