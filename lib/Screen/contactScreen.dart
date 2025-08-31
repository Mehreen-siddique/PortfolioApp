import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contactscreen extends StatefulWidget {
  const Contactscreen({super.key});

  @override
  State<Contactscreen> createState() => _ContactscreenState();
}

class _ContactscreenState extends State<Contactscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get In Touch', style:
                    TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                    ,),
                  Text("Let's discuss your next project or just say hello!", style: TextStyle(
                    fontSize: 15,

                  ),),
                  SizedBox(height: 40,),
                       Container(
               height: 80,
               width: double.infinity,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(15)),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.shade400,
                     blurRadius: 1,
                     offset: Offset(0, 0),
                   )
                 ],
               ),
               child:
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     Container(
                       height: 40,
                       width: 40,
                       decoration: BoxDecoration(
                         color: Colors.grey[400],
                         borderRadius: BorderRadius.all(Radius.circular(15)),

                       ),
                       child:
                         Icon(Icons.email_outlined, size: 20, color: Colors.black),


                     ),
                     SizedBox(width: 10,),

                     Text("mehreensiddique50@gmail.com", style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.bold,
                     ),),

                   ],
                 ),
               ),
                       ),
                  SizedBox(height: 20,),

                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        )
                      ],
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.all(Radius.circular(15)),

                            ),
                            child:
                            Icon(Icons.phone, size: 20, color: Colors.black),


                          ),
                          SizedBox(width: 10,),

                          Text("+92134567890", style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 430,
                    width: double.infinity,
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(15)),
         boxShadow: [
           BoxShadow(
             color: Colors.grey.shade400,
             blurRadius: 1,
             offset: Offset(0, 0),
       ),
                    ]
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Send A Message", style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,

                          ),),
                          SizedBox(height: 10,),
                         TextFormField(
                           decoration: InputDecoration(
                             hintText: " Your name",
                             hintStyle: TextStyle(
                               fontSize: 14,
                               color: Colors.grey
                             ),
                             filled: true,
                             fillColor: Colors.grey.shade300,
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(15),
                               borderSide: BorderSide.none,
                             ),

                           ),
                         ),
                          SizedBox(height: 10,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: " Your email",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),

                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: " Your message",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                              ),

                              filled: true,
                              fillColor: Colors.grey.shade300,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),

                            ),
                            maxLines: 5,
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minimumSize: Size(double.infinity, 50),
                            ),
                              onPressed: (){}, child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.send_outlined,
                                color: Colors.white,
                                size: 20,),
                              SizedBox(width: 10,),
                              Text("Send", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),)
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        )
                          ]

                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Follow Me", style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,

                          )),
                          SizedBox(height: 20,),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 1,
                                        offset: Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        FaIcon(FontAwesomeIcons.github, size: 20, color: Colors.black,),
                                        SizedBox(width: 10,),
                                        Text("Github", style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),)
                                      ],
                                    ),
                                  ),
                                  ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400,
                                        blurRadius: 1,
                                        offset: Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        FaIcon(FontAwesomeIcons.linkedin, size: 20, color: Colors.black,),
                                        SizedBox(width: 10,),
                                        Text("LinkedIn", style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  )


                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
