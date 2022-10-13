import 'package:covid19/GlobalView_Bloc/GlobalView_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../CountryView_Bloc/CountryView_bloc.dart';
import '../GlobalView_Bloc/GlobalView_bloc.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoRouter.of(context).location == '/global' ||
              GoRouter.of(context).location == '/countries'
          ? AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  GoRouter.of(context).location == "/global"
                      ? "Global"
                      : "Countries",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.black),
                ),
              ),
              elevation: 0,
              iconTheme: new IconThemeData(color: Colors.black),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              actions: [
                GoRouter.of(context).location == "/countries"
                    ? BlocBuilder<CountryViewBloc, CountryViewState>(
                        builder: (context, state) {
                        if (state is LoadedCountryViewState) {
                          return GestureDetector(
                            child: Icon(Icons.search),
                            onTap: () {
                              context.go('/countries/search',extra: state.countries);
                            },
                          );
                        } else {
                          return SizedBox();
                        }
                      })
                    : SizedBox()
              ],
            )
          : PreferredSize(
              child: SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).padding.top)),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: GoRouter.of(context).location == "/global"
              ? 0
              : GoRouter.of(context).location == "/countries"
                  ? 1
                  : 2,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Global'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("images/countries.png")),
                label: 'Countries'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("images/prevention.png")),
                label: 'Tips'),
          ],
          onTap: (index) async {
            if (index == 0) {
              BlocProvider.of<GlobalViewBloc>(context)
                  .add(TransitionToOtherPageFromGlobalView());
              context.go('/global');
            } else if (index == 1) {
              BlocProvider.of<CountryViewBloc>(context)
                  .add(TransitionToOtherPageFromCountryView());
              context.go('/countries');
            } else if (index == 2) {
              context.go('/symptomsandpreventions');
            }
          }),
    );
  }
}
