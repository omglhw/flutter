import 'package:abc/provider/current_index_provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loading.dart';
import 'router/application.dart';
import 'router/routers.dart';
// import 'package:flutter/rendering.dart';

void main() => {runApp(App())};

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => CurrentIndexProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Fultter Site',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: Application.router.generator,
        home: LoadingPage(),
      ),
    );
  }
}
