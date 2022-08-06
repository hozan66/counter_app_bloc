import 'package:counter_app_bloc/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../bloc/bloc_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // The path came from => getApplicationDocumentsDirectory()
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  // print('storage=${storage.runtimeType}');

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
