import 'package:e_learning/bloc/post_bloc.dart';
import 'package:e_learning/data/repository/api_repository.dart';
import 'package:e_learning/data/service/data_repository.dart';
import 'package:e_learning/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    dataService: DataService(),
  ));
}

class MyApp extends StatelessWidget {
  final DataService dataService;
  const MyApp({super.key, required this.dataService}) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc Api',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => PostBloc(
            apiRepository: ApiRepository(dataService: dataService),
          )..add(LoadPostEvent()),
          child: const HomeScreen(),
        ));
  }
}
