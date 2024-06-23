import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_project/online_shop_feature/presentation/manager/bloc/category_bloc.dart';
import 'package:online_shop_project/online_shop_feature/presentation/manager/product_list_cubit/product_list_cubit.dart';
import 'locator_service.dart' as di;
import 'locator_service.dart';
import 'online_shop_feature/presentation/pages/product_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListCubit>(create: (context) => sl<ProductListCubit>()),
        BlocProvider<ProductCategoryBloc>(create: (context) => sl<ProductCategoryBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.grey,
        ),
        home: HomePage(),
      ),
    );
  }
}
