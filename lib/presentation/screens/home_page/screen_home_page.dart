import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/Notifications/notifications_bloc.dart';
import 'package:love_bites_user_app/bussines_logic/blocs/home_page/home_page_bloc.dart';
import 'package:love_bites_user_app/presentation/screens/home_page/widgets/widgets.dart';

class ScreenHomePage extends StatelessWidget {
  ScreenHomePage({super.key});

  int index = 2;

  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(FetchMatches());

    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            selectedIndex: 2,
            gap: 10,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            onTabChange: (index) {
              context.read<HomePageBloc>().add(SelectPage(index: index));
            },
            padding: const EdgeInsets.all(14),
            tabs: const [
              GButton(
                icon: FeatherIcons.heart,
                text: 'Favorite',
              ),
              GButton(
                icon: FeatherIcons.bell,
                text: 'Notification',
              ),
              GButton(
                icon: FeatherIcons.home,
                text: 'Discover',
              ),
              GButton(
                icon: FeatherIcons.messageSquare,
                text: 'Chats',
              ),
              GButton(
                leading: CircleAvatar(
                  maxRadius: 13.5,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3YLKDZn-692kHfOHXCm37Dy5xsEmbcpqFKA&usqp=CAU'),
                ),
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state is PageSelectedState) {
              index = state.index;
            }
            return tabs[index];
          },
        ),
      ),
    );
  }
}
