import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const HomeScreen({super.key, required this.onToggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{
  bool isDark = false;


  Widget buildProfileAvatarWithCamera() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: EdgeInsets.all(0), // Space between image and border
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade400, // Border color
              width: 3,           // Border thickness
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
            // placeholder image
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 50,
            width: 50,
            decoration:  BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding:  EdgeInsets.all(6),
            child:  IconButton(onPressed: (){

            }, icon: Icon(Icons.camera_alt, size: 20)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      right: -40,
                        top: -60,
                        child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100)
                      ),
                    )),
                    Positioned(
                      right: 20,
                        top: 10,
                        child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.grey.shade400, // Border color
                            width: 1,           // Border thickness
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 1,
                              offset: Offset(0, 0),
                            )
                          ]
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isDark = !isDark;
                          });
                          widget.onToggleTheme();
                        },
                        child: AnimatedRotation(turns: isDark? 1: 0,

                            duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: AnimatedSwitcher(duration: Duration(milliseconds: 500),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return ScaleTransition(scale: animation, child: child);
                            },
                          child: Icon(
                          isDark ? Icons.dark_mode : Icons.light_mode_outlined,
                          key: ValueKey<bool>(isDark),
                          color: isDark ? Colors.white : Colors.black,
                          size: 28,
                        ),


                        ),
                        )
                      ),
                    )
                    ),
                  ],
                ),
              ),
              buildProfileAvatarWithCamera(),

             SizedBox(height: 10),
             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text("Mehreen Siddique", style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),),
                 Text("Flutter Developer", style: TextStyle(
                   fontSize: 15,
                 ),),
                 SizedBox(height: 10),
           Padding(
             padding: const EdgeInsets.only(left: 16, right: 16),
             child: Text('Dedicated to transforming ideas into elegant mobile experiences. Skilled in Flutter development, with an eye for design and a drive for performance.',
             style: TextStyle(
               fontSize: 14,
             ),
          textAlign: TextAlign.center,
             ),
           )
               ],
             ),
              SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height: 50,
                      width: 50,
                      decoration:BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400, // Border color
                            width: 1,           // Border thickness
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 1,
                              offset: Offset(0, 0),
                            )
                          ]


                      ) ,
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.github,
                          color: Colors.black,
                        ),
                        onPressed: () {
                           launchUrl(Uri.parse("https://github.com/Mehreen-Siddique"));
                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 50,
                      width: 50,
                      decoration:BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400, // Border color
                            width: 1,           // Border thickness
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 1,
                              offset: Offset(0, 0),
                            )
                          ]


                      ) ,
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.linkedin,
                          color: Colors.black,
                        ),
                        onPressed: () {
                           launchUrl(Uri.parse("https://www.linkedin.com/in/mehreen-siddique/"));
                        },
                      ),
                    ),

                  ]
              ),


              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Expanded(
                        child: Container(
                          height: 80,
                          decoration:BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),

                              ],
                              border: Border.all(
                                color: Colors.grey.shade400, // Border color
                                width: 1,           // Border thickness
                              ),



                          ) ,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("15 +", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                              Text("Projects", style: TextStyle(
                                fontSize: 14,
                              ),),
                              SizedBox(height: 10,),
                            ],
                          )
                          ),
                        ),

                      SizedBox(width: 15,),
                      Expanded(
                        child: Container(
                            height: 80,
                            decoration:BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),

                              ],
                              border: Border.all(
                                color: Colors.grey.shade400, // Border color
                                width: 1,           // Border thickness
                              ),



                            ) ,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Text("6 months", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                                Text("Learning", style: TextStyle(
                                  fontSize: 14,
                                ),),
                                SizedBox(height: 10,),
                              ],
                            )
                        ),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        child: Container(
                            height: 80,
                            decoration:BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                ),

                              ],
                              border: Border.all(
                                color: Colors.grey.shade400, // Border color
                                width: 1,           // Border thickness
                              ),



                            ) ,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Text("5 +", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),),
                                Text("Skills", style: TextStyle(
                                  fontSize: 14,
                                ),),
                                SizedBox(height: 10,),
                              ],
                            )
                        ),
                      ),

                    ]
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 0.7,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      )
                    ]

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("About Me", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('A motivated Flutter developer eager to transform ideas into beautiful and functional mobile applications. With 6 months of dedicated learning and practice, I have developed several projects that reflect my passion for coding and UI/UX design. Always curious to learn, grow, and adapt to new technologies, I aim to contribute to impactful projects and start my professional journey in the tech industry.',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        )
    );
  }
}
