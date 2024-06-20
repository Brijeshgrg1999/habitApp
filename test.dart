            Container( child:  
             Container(
                          width: 350,
                          child: AnimatedButtonBar(
                            radius: 28.0,
                            padding: const EdgeInsets.all(16.0),
                            backgroundColor: Colors.blueGrey.shade800,
                            foregroundColor: Colors.blueGrey.shade300,
                            elevation: 2,
                          //  borderColor: Colors.white,
                            borderWidth: 2,
                            innerVerticalPadding: 16,
                            children: [
                              ButtonBarEntry(
                                  onTap: () => print('First item tapped'),
                                  child: Text("Today" , style: TextStyle(color: Colors.white),),
                              ),
                              ButtonBarEntry(
                                  onTap: () => print('Second item tapped'),
                                 child:Text("All habits",style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
            ) , 

