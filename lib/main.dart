import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app_f/colors.dart';
import 'package:my_app_f/product_stock/product_stock.dart';
import 'package:my_app_f/sales_report/sales_report.dart';
import 'package:my_app_f/tools_n_maintenance/tools_n_maintenance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController controller = PageController();

  final ScrollController scrollController = ScrollController();

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);

    _tabController.addListener(() {
      scrollController.animateTo(
        100,
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarColor: Colors.white, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder:
                  (context, innerBoxIsScrolled) => [
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context,
                      ),
                      sliver: SliverAppBar(
                        floating: true,
                        expandedHeight: 100,
                        forceElevated: innerBoxIsScrolled,
                        backgroundColor: AppColors.background,
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          background: DecoratedBox(
                            decoration: BoxDecoration(
                              color: AppColors.background,
                            ),
                          ),
                          title: Container(
                            height: 35,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.secondaryDark,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TabBar(
                              controller: _tabController,
                              unselectedLabelColor: AppColors.secondaryLight,
                              indicator: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primary,
                                    AppColors.secondary,
                                  ],
                                ),
                              ),
                              labelColor: AppColors.surface,
                              indicatorSize: TabBarIndicatorSize.label,
                              dividerHeight: 0,
                              padding: EdgeInsets.zero,
                              indicatorPadding: EdgeInsets.symmetric(
                                horizontal: -10,
                              ),
                              labelStyle: TextTheme.of(context).titleSmall,
                              indicatorWeight: 0,
                              labelPadding: EdgeInsets.zero,
                              textScaler: TextScaler.linear(0.5),
                              tabs: [
                                Tab(
                                  icon: Icon(Icons.bar_chart_rounded, size: 15),
                                  text: "Report",
                                ),
                                Tab(
                                  icon: Icon(
                                    Icons.inventory_2_rounded,
                                    size: 15,
                                  ),
                                  text: "Stock",
                                ),
                                Tab(
                                  icon: Icon(Icons.build_rounded, size: 15),
                                  text: "Operational",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              body: TabBarView(
                controller: _tabController,
                children: [
                  const SalesReport(),
                  const ProductStockPage(),
                  const ToolsNMaintenancePage(),
                ],
              ),
            ),

            // Container(
            //   height: statusBarHeight,
            //   width: mediaQuery.size.width,
            //   color: Colors.blue.shade100,
            // ),
          ],
        ),
      ),
    );
  }
}
