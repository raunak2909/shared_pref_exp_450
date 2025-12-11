import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Updates'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.qr_code)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 11,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index){
                  if(index==0){
                    return Container(
                      padding: EdgeInsets.all(11),
                      margin: EdgeInsets.only(right: 11),
                      width: 110,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(21)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green.shade200
                                ),
                              ),
                              Positioned(
                                bottom: 1,
                                right: 1,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.green,
                                  child: Center(
                                    child: Icon(Icons.add, size: 16,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Text('Add status')
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.all(11),
                      margin: EdgeInsets.only(right: 11),
                      width: 110,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          borderRadius: BorderRadius.circular(21)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green.shade200
                            ),
                          ),
                          Text('Contact Name')
                        ],
                      ),
                    );
                  }
                }),
              ),
              SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Channels', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0
                    ),
                      onPressed: (){}, child: Text("Explore"))
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 11),
                    child: Text('All'),
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(21)
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 11),
                    child: Text('Unread 2'),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5
                      ),
                        borderRadius: BorderRadius.circular(21)
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 11),
                    child: Text('My channels'),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5
                        ),
                        borderRadius: BorderRadius.circular(21)
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11,
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (_, index){
                return Container(
                  margin: EdgeInsets.only(bottom: 11),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green.shade200,
                      ),
                      SizedBox(
                        width: 21,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Channel Name', style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),),
                            Text('Last message')
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('11:11 AM'),
                          SizedBox(
                            height: 2,
                          ),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.green,
                            child: Center(
                              child: Text('2', style: TextStyle(
                                color: Colors.white
                              ),),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
