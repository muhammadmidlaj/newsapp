import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/injection/injection.dart';
import 'package:news_app/data/datasource/remote/news_remote_source.dart';
import 'package:news_app/presentation/cubit/news_cubit.dart';
import 'package:news_app/presentation/pages/home_page.dart';
import 'package:news_app/core/injection/injection.dart' as di;
import 'package:news_app/presentation/pages/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.locator<NewsCubit>(),
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LayoutPage(),
      ),
    );
  }
}
