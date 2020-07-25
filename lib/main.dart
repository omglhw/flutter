import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => {runApp(App())};

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '第一个app',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('第一个app2'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('images/coast.jpg',
                height: 240, width: 500, fit: BoxFit.fill),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(children: <Widget>[
                AddressWidget(),
                ButtonsWidget(),
                TextContent()
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('风景区地址4', style: TextStyle(fontWeight: FontWeight.w600)),
                  Text('广东省深圳市宝安区西乡街道324Dk',
                      style: TextStyle(color: Colors.grey)),
                ]),
          ),
          Icon(
            Icons.star,
            color: Colors.grey,
          ),
          Text(
            '60',
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ));
  }
}

class ButtonsWidget extends StatelessWidget {
  final TextStyle ts = TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ButtonWrapper(
            text: Text(
              '电话',
              style: ts,
            ),
            icon: Icon(
              Icons.phone,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          child: ButtonWrapper(
            text: '导航',
            // icon: Icon( Icons.near_me,  color: Colors.grey ),
            // icon: Transform.rotate( angle: 1 ,
            // child:Icon( Icons.navigation,  color: Colors.grey ),
            // )
            icon: Transform(
              origin: Offset(0, 0),
              transform: Matrix4.identity()..rotateZ(40),
              child: Icon(Icons.navigation, color: Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: ButtonWrapper(
            text: Text(
              '分享',
              style: ts,
            ),
            icon: Icon(
              Icons.share,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

// 泛型, 继承 (如何多继承 T extends Text an String ????)
class ButtonWrapper<T, I extends Widget> extends StatelessWidget {
  final T text;
  final I icon;
  ButtonWrapper({this.text, this.icon});
  Widget _textWidget() {
    if (this.text is String) {
      return Text(this.text as String);
    }
    return this.text as Widget;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[this.icon, _textWidget()]);
  }
}

class TextContent extends StatelessWidget {
  final String text = '''
  3D/mali_winsys(28350): EGLint new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, egl_winsys_surface **, EGLBoolean) returns 0x3000
E/BpSurfaceComposerClient(28350): Failed to transact (-1)/n
E/BpSurfaceComposerClient(28350): Failed to transact (-1)
W/InputMethodManager(28350): startInputReason = 1
D/ZrHung.AppEyeUiProbe(28350): stop checker.
W/libEGL  (28350): EGLNativeWindowType 0x7bccd9e010 disconnect failed
D/ViewRootImpl[MainActivity](28350): surface should not be released
W/libEGL  (28350): EGLNativeWindowType 0x7bf47b2010 disconnect failed
D/ZrHung.AppEyeUiProbe(28350): Current Activity:false
D/ZrHung.AppEyeUiProbe(28350): not watching, wait.
Reloaded 1 of 495 libraries in 1,415ms.
''';
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        height: 100,
        // child: Text(text),
        child:
        new CustomScrollView(shrinkWrap: false, slivers: <Widget>[
          
        // new  SliverPadding(
        //     padding:const EdgeInsets.all(20),
            new SliverList(
                delegate:new SliverChildListDelegate(<Widget>[
               Text(text),
            ])),
            
          // )
        ])
        );
  }
}
