import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';
import '../model/login_screen_response.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginBloc(),
        // child: const GenerativeWidget());
        child: const LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    context.read<LoginBloc>().add(LoginScreenEvent());
    super.initState();
  }

  LoginScreenResponse? responseLoginScreen;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          // show dialog error
          if (kDebugMode) {
            print("Error :${state.message}");
          }
        }
      },
      builder: (context, state) {
        if (state is LoginScreenState) {
          responseLoginScreen = state.responseLoginScreen;
          return MyHomePage(title: 'API BLOC DIO BMRS', responseLoginScreenData: responseLoginScreen);
        }
        return Scaffold(
            body: Container(
          color: Colors.white,
        ));
      },
      buildWhen: (context, state) {
        return state is LoginScreenState;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.responseLoginScreenData, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final LoginScreenResponse? responseLoginScreenData;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late LoginScreenResponse? responseLoginScreenData;
  @override
  void initState() {
    responseLoginScreenData = widget.responseLoginScreenData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                responseLoginScreenData?.body?.screeninfo?.btnchangelang ?? ' ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                responseLoginScreenData?.body?.screeninfo?.imglogo ?? ' ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                responseLoginScreenData?.body?.screeninfo?.edtID ?? ' ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                responseLoginScreenData?.body?.screeninfo?.edtpass ?? ' ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                responseLoginScreenData?.body?.screeninfo?.btnlogin ?? ' ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                responseLoginScreenData?.body?.screeninfo?.btnforgotpass ?? ' ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                responseLoginScreenData?.body?.screeninfo?.textreg ?? ' ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                responseLoginScreenData?.body?.screeninfo?.btnReg ?? ' ',
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
