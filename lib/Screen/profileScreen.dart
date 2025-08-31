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
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                blurRadius: 3,
                offset: Offset(0, 0),
              )
            ],
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
              color: Theme.of(context).cardColor,
              shape: BoxShape.circle,
            ),
            padding:  EdgeInsets.all(6),
            child:  IconButton(onPressed: (){

            }, icon: Icon(Icons.camera_alt,
                color: Theme.of(context).iconTheme.color,
                size: 20)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(100),

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
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey.shade800   // dark mode border
                                : Colors.grey.shade300,   // Border color
                            width: 1,           // Border thickness
                          ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor.withOpacity(0.2),
                            blurRadius: 3,
                            offset: Offset(0, 0),
                          )
                        ],
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
                          isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
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
                 Text("Mehreen Siddique",  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                   fontWeight: FontWeight.bold,
                 ),),
                 Text("Flutter Developer", style: Theme.of(context).textTheme.bodyLarge,),
                 SizedBox(height: 10),
           Padding(
             padding: const EdgeInsets.only(left: 16, right: 16),
             child: Text('Dedicated to transforming ideas into elegant mobile experiences. Skilled in Flutter development, with an eye for design and a drive for performance.',
               style: Theme.of(context).textTheme.bodyMedium,
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
                        color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey.shade800   // dark mode border
                              : Colors.grey.shade300,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor.withOpacity(0.2),
                            blurRadius: 3,
                            offset: Offset(0, 0),
                          )
                        ],


                      ) ,
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.github,
                          color: Theme.of(context).iconTheme.color,
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
                        color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.grey.shade800   // dark mode border
                              : Colors.grey.shade300,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor.withOpacity(0.2),
                            blurRadius: 3,
                            offset: Offset(0, 0),
                          )
                        ],


                      ) ,
                      child: IconButton(
                        icon: FaIcon(FontAwesomeIcons.linkedin,
                          color: Theme.of(context).iconTheme.color,
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
                            color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey.shade800   // dark mode border
                                  : Colors.grey.shade300,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).shadowColor.withOpacity(0.2),
                                blurRadius: 3,
                                offset: Offset(0, 0),
                              )
                            ],



                          ) ,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text("15 +", style: Theme.of(context).textTheme.bodyLarge,),
                              Text("Projects", style: Theme.of(context).textTheme.bodyMedium,),
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
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.grey.shade800   // dark mode border
                                    : Colors.grey.shade300,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                )
                              ],


                            ) ,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Text("6 months", style: Theme.of(context).textTheme.bodyLarge,),
                                Text("Learning", style: Theme.of(context).textTheme.bodyMedium,),
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
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.grey.shade800   // dark mode border
                                    : Colors.grey.shade300,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                )
                              ],


                            ) ,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Text("5 +", style: Theme.of(context).textTheme.bodyLarge,),
                                Text("Skills", style: Theme.of(context).textTheme.bodyMedium,),
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
                  padding: EdgeInsets.all(10),
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade800   // dark mode border
                          : Colors.grey.shade300,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.2),
                        blurRadius: 3,
                        offset: Offset(0, 0),
                      )
                    ],

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("About Me", style: Theme.of(context).textTheme.bodyLarge,),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('A motivated Flutter developer eager to transform ideas into beautiful and functional mobile applications. With 6 months of dedicated learning and practice, I have developed several projects that reflect my passion for coding and UI/UX design. Always curious to learn, grow, and adapt to new technologies, I aim to contribute to impactful projects and start my professional journey in the tech industry.',
                          style: Theme.of(context).textTheme.bodyMedium,
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
