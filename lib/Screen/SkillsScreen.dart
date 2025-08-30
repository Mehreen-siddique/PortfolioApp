import 'package:flutter/material.dart';

class Skillsscreen extends StatefulWidget {
  const Skillsscreen({super.key});

  @override
  State<Skillsscreen> createState() => _SkillsscreenState();
}

class _SkillsscreenState extends State<Skillsscreen> {
  Widget buildSkillCard(){
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return     Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 1,
                offset: Offset(0, 0),
              )
            ],
            border: Border.all(
              color: Colors.grey.shade400, // Border color
              width: 1,           // Border thickness
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                Row(


                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey[400],
                      child: const Icon(Icons.palette_outlined, size: 30, color: Colors.white),
                    ),
                    SizedBox(width: 10,),
                    Text(" Design & Tools", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),

                  ],
                ),

              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Git/GitHub", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 155,),
                  Text("50%",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400

                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  value: 0.5,
                  backgroundColor: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),

                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Figma", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 155,),
                  Text("50%",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400

                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  value: 0.5,
                  backgroundColor: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),

                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Canva", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(width: 155,),
                  Text("50%",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400

                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: LinearProgressIndicator(
                  minHeight: 8,
                  value: 0.5,
                  backgroundColor: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),

                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              ),

            ],
          ),

        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
body: Padding(padding: EdgeInsets.all(10.0),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(" Skills & Expertise", style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),),
Text("Technologies and tools | work with", style: TextStyle(
  fontSize: 15,

),),
    SizedBox(height: 20,),
    Expanded(child: buildSkillCard()),

  ],
),
),
        ),
      ),
    );
  }
}
