import 'package:api_call/Model/get_model.dart';
import 'package:api_call/Services/get_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommandsModel> commandsModel = [];
  getComments() {
    GetApiServices().getCommentsModel().then((value) {
      setState(() {
        commandsModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(title: const Text("GET API")),
      body: Stack(

        children:[
          Positioned.fill(child: Image.asset('assets/background.jpeg', fit: BoxFit.cover,
          )),
          ListView.builder(
            shrinkWrap: true,
            itemCount: commandsModel.length,
            itemBuilder: (context, index) {
              final apidata = commandsModel[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(

                  color: Colors.blue[50],
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 3),
                        CircleAvatar(
                          backgroundColor: Colors.blue[300],
                          child: Text(
                            apidata.id.toString(),
                            style: TextStyle(fontWeight:  FontWeight.bold, fontSize:  22),
                          ),
                        ),
                        const SizedBox(width: 5),
                        SizedBox(
                          width: MediaQuery.of(context).size. width/1.25,
                          child: Column(
                            crossAxisAlignment:   CrossAxisAlignment.start,
                            children: [
                              Text(
                                apidata.name.toString(),
                                maxLines: 1,
                                style: TextStyle(fontWeight:  FontWeight.bold, fontSize:  22),
                              ),
                              Text(
                                apidata.email.toString(),
                                style: TextStyle(fontWeight:  FontWeight.bold),
                              ),
                              Text(
                                apidata.body.toString(),
                                style: TextStyle(fontWeight:  FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ]
                    ),
                  )
                ),
              );
            },
          ),
        ] 
      ),
    );
  }
}
