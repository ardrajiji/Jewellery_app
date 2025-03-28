import 'package:flutter/material.dart';
import 'package:jewellery_app/view/employee_module/emp_home.dart';
import 'package:jewellery_app/view/employee_module/emp_login/page/emp_login.dart';
import 'package:jewellery_app/view/user_indroduction_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:jewellery_app/view/user_module/login/page/user_login.dart';
import 'package:jewellery_app/view/user_module/user_home/page/user_home_screen.dart';
import 'package:jewellery_app/view/user_separation.dart';
import 'package:jewellery_app/view/utils/prefence_value.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isUserFirstLaunch = await PreferenceValues.getUserIntroScreenStatus();
  bool isEmployeeFirstLaunch = await PreferenceValues.getEmployeeIntroScreenStatus();
  bool isUserLoggedIn = await PreferenceValues.getUserLoginStatus();
  bool isEmployeeLoggedIn = await PreferenceValues.getEmployeeLoginStatus();

   Widget initialScreen;
   if (isUserFirstLaunch) {
    initialScreen = const OnboardingPage1();
  } else {
    if (isEmployeeFirstLaunch) {
      initialScreen = const OnboardingPage1();
    } else {
      initialScreen = const SignUpSelectionPage();
    }
  }

// if (isUserFirstLaunch) {
//   initialScreen = const OnboardingPage1();
// } else {
//   initialScreen = const SignUpSelectionPage();
// }

// if (isEmployeeFirstLaunch) {
//   initialScreen = const OnboardingPage1();
// } else {
//   initialScreen = const SignUpSelectionPage();
// }

// if (isUserLoggedIn) {
//   initialScreen = const UserHomeScreen();
// } else {
//   initialScreen = const UserLogin();
// }

// if (isEmployeeLoggedIn) {
//   initialScreen = const EmployeeHomePage();
// } else {
//   initialScreen = const EmployeeLoginPage();
// }

  runApp(MyApp(
    initialScreen: initialScreen,
  ));
}


class MyApp extends StatelessWidget {
  final Widget initialScreen;
  const MyApp({
    super.key,
    required this.initialScreen,
  });
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/irenne.jpg',
          height: 150, // Set the height
          width: 150, // Set the width
          fit: BoxFit.cover, // Adjust how the image fits its container
          // color: Colors.green, // Apply a tint color with transparency
          alignment: Alignment.center, // Align the image within its container
        ),
        backgroundColor: const Color.fromRGBO(43, 13, 65, 1.0),
    
        splashTransition: SplashTransition.scaleTransition,
        
        nextScreen: initialScreen,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
