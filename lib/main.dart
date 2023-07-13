import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/HomeScreen.dart';
import 'package:todo/ui/Theme/MyTheme.dart';
import 'package:todo/ui/provider/theme_provider.dart';
import 'package:todo/ui/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/ui/taps/editTaskScreen.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: "todo-95af4"
  );
  runApp(
      ChangeNotifierProvider(
        create: (_)=> themeprovider(),
        child: MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    themeprovider provider = Provider.of<themeprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: provider.isdark()?MyTheme.DarkTheme:MyTheme.LightTheme,
      routes: {
          registerScreen.routeName: (_) => registerScreen(),
          EditTaskScreen.routeName:(_) => EditTaskScreen(),
          HomeScreen.routeName : (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

