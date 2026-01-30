import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/routes/router_constants.dart';
import 'package:unblockmycar/shared/common_button.dart';
import 'package:unblockmycar/shared/common_card.dart';
import 'package:unblockmycar/shared/common_icon.dart';
import 'package:unblockmycar/shared/common_list_tile.dart';
import 'package:unblockmycar/shared/common_text.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen({super.key});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // First container - Header
              FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF0A3D62), Color(0xFF0F6E8C)],
                    ),
                  ),
                  child: Row(
                    children: [
                      CommonIcon(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 40),
                      const CommonText(
                        name: "Vehicle Details",
                        font: FontWeight.bold,
                        textcolor: Colors.white,
                        fontsize: 20,
                      ),
                    ],
                  ),
                ),
              ),

              // Floating Card - Now inside ScrollView
              Transform.translate(
                offset: const Offset(0, -50),
                child: SlideTransition(
                  position:
                      Tween<Offset>(
                        begin: const Offset(0, -0.5),
                        end: Offset.zero,
                      ).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.elasticOut,
                        ),
                      ),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FloatingCard(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Second container - Content
              Transform.translate(
                offset: const Offset(0, -50),
                child: SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonCard(
                            iconColor: Color.fromARGB(255, 15, 86, 119),
                            icon: CupertinoIcons.person,
                            title: "Gopinath",
                            subtitle: "Linked - contact hidden",
                            icon2: CupertinoIcons.lock,
                            isIcon: false,
                          ),
                          const SizedBox(height: 20),
                          CommonButton(
                            icon: Icons.notifications_none,
                            color: const Color.fromARGB(255, 15, 86, 119),
                            onPressed: () {
                              context.pushNamed(RouterConstants.notifyScreen);
                            },
                            child: const CommonText(
                              name: "Notify Owner",
                              textcolor: Colors.white,
                            ),
                          ),
                          
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//floating card
class FloatingCard extends StatelessWidget {
  const FloatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(39),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(name: "Vehicle Number", fontsize: 18),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 30,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: CommonText(
                      name: "KL-07-AB-1234",
                      font: FontWeight.bold,
                      fontsize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),

          //details card
          CommonListTile(
            title: "Vehicle Type",
            subtitle: "SUV",
            icon: CupertinoIcons.car_detailed,
          ),
          Divider(thickness: 2, color: Colors.grey[200]),
          CommonListTile(
            title: "Model",
            subtitle: "Kia Seltos",
            icon: CupertinoIcons.car_detailed,
          ),
          Divider(thickness: 2, color: Colors.grey[200]),
          CommonListTile(
            title: "Color",
            subtitle: "Silver",
            icon: Icons.palette,
          ),
          Divider(thickness: 2, color: Colors.grey[200]),
          CommonListTile(
            title: "Registration Year",
            subtitle: "2026",
            icon: Icons.calendar_today_outlined,
          ),
          Divider(thickness: 2, color: Colors.grey[200]),
          CommonListTile(
            title: "Fuel Type",
            subtitle: "Diesel",
            icon: Icons.local_gas_station,
          ),
        ],
      ),
    );
  }
}
