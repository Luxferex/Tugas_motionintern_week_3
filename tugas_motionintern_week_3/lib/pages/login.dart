import 'package:flutter/material.dart';
import 'package:tugas_motionintern_week_3/pages/home.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 217, 214, 214),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                child: Image.asset("assets/images/amin.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Motion",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              KolomLogin(
                hintText: "email",
                prefixIcon: Icon(Icons.mail),
                suffixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20),
              KolomLogin(
                hintText: "password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55),
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(55),
                          bottomLeft: Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1.0,
                            offset: Offset(2.5, 2.5),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the logos horizontally
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/images/google.png"),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      child: Image.asset("assets/images/Fb.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KolomLogin extends StatelessWidget {
  const KolomLogin({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
  });

  final String hintText;
  final Icon prefixIcon;
  final Icon suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: EdgeInsets.only(left: 20, right: 25),
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(45),
            bottomLeft: Radius.circular(45),
          ),
          border: Border.all(color: Colors.indigo, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 1.0,
              offset: Offset(2.5, 2.5),
            )
          ]),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
