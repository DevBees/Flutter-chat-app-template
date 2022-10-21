// ignore_for_file: prefer_const_constructors

//TODO 29: Import cloud firestore, firebase auth, intl, scaffold gradient and database services
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen(
      {Key? key,
      required this.id,
      required this.groupName,
      required this.color,
      required this.overall})
      : super(key: key);
  final String id;
  final String groupName;
  final Color color;
  final double overall;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  //TODO 30: Create instances of Firebase auth, firebase firestore, text editing controller and database services

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //TODO 31: dispose of the text editing controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: ScaffoldGradientBackground(
        gradient: const LinearGradient(
          colors: [
            Color(0xffFFF3B0),
            Color(0xffCA26FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                w * 0.05,
              ),
              bottomRight: Radius.circular(
                w * 0.05,
              ),
            ),
          ),
          toolbarHeight: h * 0.1,
          backgroundColor: Color(0xffFFF3B0),
          leading: Container(
            margin: EdgeInsets.only(
              left: w * 0.05,
            ),
            child: CircleAvatar(
              radius: w * 0.6,
              backgroundColor: widget.color,
              child: Text(
                widget.groupName.substring(0, 1),
                style: TextStyle(
                  color: widget.overall > 127.5 ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: w * 0.06,
                ),
              ),
            ),
          ),
          title: Text(
            widget.groupName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: w * 0.07,
              fontWeight: FontWeight.w500,
            ),
          ),
          leadingWidth: 60,
        ),
        body:
            //TODO 32a: specify type of stream as QuerySnapshot
            StreamBuilder(

                //TODO 32b: Provide messages stream ordered by 'Time' parameter. This avoids the error in the line 'snapshot.data!.docs' getter
                stream: null,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Unable to load messages',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: w * 0.08,
                              color: Color(0xff37007C).withOpacity(0.4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasData
                      // &&
                      // snapshot.data!
                      // .
                      // docs.
                      // isNotEmpty
                      ) {
                    //TODO 33a: Create messages List<DocumentSnapshot>
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: w * 0.015,
                              right: w * 0.015,
                              top: h * 0.015,
                            ),
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                //TODO 37: Return Message Bubble widget with username, message, current user or not, and photo url instead of Container
                                return Container();
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              //TODO 33b: provide messages List<DocumentSnapshot> length instead of number 10
                              itemCount: 10,
                            ),
                          ),
                        ),
                        Container(
                          // width: w * 0.7,
                          margin: EdgeInsets.only(
                            left: w * 0.04,
                            right: w * 0.04,
                            bottom: h * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                w * 0.03,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: w * 0.03,
                                  right: w * 0.01,
                                ),
                                width: w * 0.75,
                                child: TextFormField(
                                  //TODO 34: set controller
                                  cursorColor: Color(0xff37007C),
                                  style: TextStyle(
                                    color: Color(0xff37007C),
                                    fontSize: w * 0.045,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type message...',
                                    hintStyle: TextStyle(
                                      color: Color(0xffF3C9FF),
                                      fontSize: w * 0.045,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  //TODO 35: Get message and write to database using database services
                                  //TODO 36: clear controller
                                },
                                icon: Icon(
                                  Icons.send_rounded,
                                  size: w * 0.08,
                                  color: Color(0xff37007C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasData
                      // && snapshot.data!.docs.isEmpty
                      ) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: h * 0.02,
                          ),
                          Text(
                            'Start a conversation',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: w * 0.08,
                              color: Color(0xff37007C).withOpacity(0.4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: w * 0.04,
                              right: w * 0.04,
                              bottom: h * 0.02,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  w * 0.03,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: w * 0.03,
                                    right: w * 0.01,
                                  ),
                                  width: w * 0.75,
                                  child: TextFormField(
                                    //TODO 38: set same controller used when snapshot data is not empty
                                    cursorColor: Color(0xff37007C),
                                    style: TextStyle(
                                      color: Color(0xff37007C),
                                      fontSize: w * 0.045,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Type message...',
                                      hintStyle: TextStyle(
                                        color: Color(0xffF3C9FF),
                                        fontSize: w * 0.045,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    //TODO 39: Write data to database using database services and clear controller
                                  },
                                  icon: Icon(
                                    Icons.send_rounded,
                                    size: w * 0.08,
                                    color: Color(0xff37007C),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff650088),
                      ),
                    );
                  }
                }),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String? username;
  final String message;
  final String? dpURL;
  final bool isMe;
  const MessageBubble({
    Key? key,
    required this.username,
    required this.message,
    required this.dpURL,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            minWidth: w * 0.01,
            maxWidth: w * 0.5,
          ),
          padding: EdgeInsets.only(
            left: isMe ? w * 0.03 : w * 0.02,
            right: isMe ? w * 0.02 : w * 0.03,
            top: h * 0.005,
            bottom: h * 0.01,
          ),
          decoration: BoxDecoration(
            color: isMe ? Color(0xff650088) : Color(0xffF2CCFF),
            borderRadius: isMe
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(
                      w * 0.05,
                    ),
                  )
                : BorderRadius.only(
                    bottomRight: Radius.circular(
                      w * 0.05,
                    ),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: w * 0.03,
                    backgroundImage: NetworkImage(dpURL!),
                  ),
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Flexible(
                    child: Text(
                      username!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        color: isMe ? Color(0xffF8E5FF) : Color(0xff650088),
                        fontWeight: FontWeight.w600,
                        fontSize: w * 0.05,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: h * 0.012,
              ),
              Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.white : Color(0xff650088),
                  fontWeight: FontWeight.w400,
                  fontSize: w * 0.04,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
