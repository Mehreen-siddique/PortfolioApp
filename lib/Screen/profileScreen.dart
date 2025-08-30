import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                          color: Colors.white,
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
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.light_mode_outlined),
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
                        // launchUrl(Uri.parse("https://github.com/yourusername"));
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
                        // launchUrl(Uri.parse("https://github.com/yourusername"));
                      },
                    ),
                  ),
          
              ]
                  ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Expanded(
                        child: Container(
                          height: 70,
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
                          child: IconButton(
                            icon: FaIcon(FontAwesomeIcons.github,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // launchUrl(Uri.parse("https://github.com/yourusername"));
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          height: 70,
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
                          child: IconButton(
                            icon: FaIcon(FontAwesomeIcons.github,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // launchUrl(Uri.parse("https://github.com/yourusername"));
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          height: 70,
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
                          child: IconButton(
                            icon: FaIcon(FontAwesomeIcons.github,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // launchUrl(Uri.parse("https://github.com/yourusername"));
                            },
                          ),
                        ),
                      ),

                    ]
                ),
              ),
          
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 200,
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
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}
