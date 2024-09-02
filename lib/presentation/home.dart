import 'dart:io';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid){
      checkForInAppUpdate();
    }
  }

  int _selectedTab=0;
  Widget getHome(int index, BuildContext context){
    List<Widget> bodyWidgets= [
    ];
    return bodyWidgets.elementAt(index);
  }


  void showMandatoryBottomSheet(){
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      backgroundColor: Theme.of(context).primaryColor,
      builder: (context){
        return PopScope(
          canPop: false,
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('COMPLETE PROFILE',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Complete your profile to get matches'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _selectedTab=3;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.white
                          ),
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Go To Profile',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();

  }

  //In App Update
  Future<void> checkForInAppUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      if (info.immediateUpdateAllowed) {
        InAppUpdate.performImmediateUpdate();
      } else if (info.flexibleUpdateAllowed) {
        InAppUpdate.startFlexibleUpdate();
      }else{
        debugPrint("update>>> ${info.toString()}");
      }
    });
  }
}