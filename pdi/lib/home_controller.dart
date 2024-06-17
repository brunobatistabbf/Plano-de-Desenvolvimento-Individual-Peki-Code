import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeController extends InheritedNotifier<ValueNotifier> {
  HomeController({Key? key, required Widget child
  }): super
  (
    key: key, 
    child: child, 
    notifier: ValueNotifier(0)
    );

  static of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<HomeController>()!;
  }

  int get value => notifier!.value;
  
  increment(){
    notifier!.value++;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}