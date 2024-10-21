import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepagedana extends StatefulWidget {
  const Homepagedana({super.key});
  @override
  State<Homepagedana> createState() => _HomepagedanaState();
}

class _HomepagedanaState extends State<Homepagedana> {
  int _selectedIndex = 0; 
  void _onItemTapped(int index) {
    setState(() {
      if (index != 2) {
        _selectedIndex = index;
      }
    });
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Stack(
          children: [
            AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Rp',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '0',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              backgroundColor: Colors.blue,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/logo_dana.png'),
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.envelope,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 50,
              left: 15,
              right: 15,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildAppBarIcon(Icons.qr_code, "Scan"),
                      _buildAppBarIcon(Icons.add, "Top Up"),
                      _buildAppBarIcon(Icons.send, "Send"),
                      _buildAppBarIcon(Icons.request_page, "Request"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Card(
                color: Colors.white, 
                elevation: 2, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), 
                ),
                clipBehavior: Clip.antiAlias, 
                child: Padding(
                  padding: const EdgeInsets.all(16), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.lightbulb, color: Colors.orange, size: 30),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Electricity",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Pay electric bills here!',
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text("PAY NOW"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      
                      Container(
                        color: Colors.white, 
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: GridView.count(
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              _buildGridItemWithImage('images/dana_deals.png', "DANA Deals"),
                              _buildGridItemWithImage('images/voucher_rewards.png', "Voucher A+ Rewards"),
                              _buildGridItemWithImage('images/emas.png', "eMAS"),
                              _buildGridItemWithImage('images/dana_goals.png', "DANA Goals"),
                              _buildGridItemWithImage('images/play_store.png', "Google Play Store"),
                              _buildGridItem(Icons.phone_android, "Pulsa & Data"),
                              _buildGridItemWithImage('images/dana_kaget.png', "DANA Kaget"),
                              _buildGridItem(Icons.more_horiz, "View All"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              
              Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), 
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Feed",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Find out what your friends are up to!',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.blue,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text("EXPLORE"),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 20,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: "Your Friend", style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: " just received"),
                                  TextSpan(text: " Cashback", style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: " from"),
                                  TextSpan(text: " Merchant", style: TextStyle(color: Colors.orange)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 10), 
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                onPageChanged: (value) {},
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset('images/sungjinwoo.jpg', fit: BoxFit.cover),
                  Image.asset('images/sukuna.jpg', fit: BoxFit.cover),
                  Image.asset('images/solo.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: _buildBottomNavigationBar(),
  );
}


  Widget _buildAppBarIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 25, color: Colors.white),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildGridItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.transparent,
          child: Icon(icon, color: Colors.blue, size: 36),
        ),
        const SizedBox(height: 5),
        Text(label,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildGridItemWithImage(String imagePath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imagePath, width: 36, height: 36),
        const SizedBox(height: 5),
        Text(label,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavigationItem('images/dana_footer.png', "Home", 0),
            _buildBottomNavigationItem('images/history.png', "History", 1),
            _buildBottomNavigationItemWithStack(Icons.qr_code, "PAY", 2),
            _buildBottomNavigationItemWithNotification('images/wallet.png',
                "Pocket", 3, Icons.confirmation_number, Colors.red),
            _buildBottomNavigationItemWithNotification(
                'images/user.png', "Me", 4, Icons.shield, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationItem(String asset, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            asset,
            width: 36,
            height: 30,
            color: _selectedIndex == index ? Colors.black : null,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? Colors.black
                  : const Color.fromARGB(255, 127, 125, 125),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationItemWithStack(
      IconData icon, String label, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Remove the MouseRegion to prevent hover effect
          Container(
            width: 150,
            height: 130,
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Colors.blue
                  : Colors.blue, // Keep the same color
              shape: BoxShape.circle,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationItemWithNotification(String asset, String label,
      int index, IconData notificationIcon, Color notificationColor) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                asset,
                width: 36,
                height: 30,
                color: _selectedIndex == index ? Colors.black : null,
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: _selectedIndex == index
                      ? Colors.black
                      : const Color.fromARGB(255, 127, 125, 125),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 10,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: notificationColor, 
                shape: BoxShape.circle,
              ),
              child: Icon(
                notificationIcon, 
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
