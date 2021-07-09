part of 'screens.dart';

const _maxHeight = 650.0;
const _minHeight = 70.0;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _expanded = false;
  double _currentHeight = _minHeight;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final menuWidth = size.width * 0.7;

    var menuProvider = Provider.of<MenuProvider>(context);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Center(child: Text("List Product")),
            backgroundColor: maroonColor,
          ),
          backgroundColor: whiteColor,
          body: RefreshIndicator(
            onRefresh: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (a, b, c) => MainPage(),
                    transitionDuration: Duration(seconds: 1)),
              );
              return Future.value(false);
            },
            child: FutureBuilder(
                future: menuProvider.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Menu> data = snapshot.data;

                    int index = 0;

                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Wrap(
                          spacing: 32,
                          runSpacing: 32,
                          children: data.map((item) {
                            index++;
                            return Container(
                              child: MenuCard(item),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: SpinKitFadingCircle(
                      size: 50,
                      color: maroonColor,
                    ),
                  );
                }),
          ),
          extendBody: true,
          bottomNavigationBar: GestureDetector(
            onVerticalDragUpdate: _expanded
                ? (details) {
                    setState(() {
                      final newHeight = _currentHeight - details.delta.dy;
                      _controller.value = _currentHeight / _maxHeight;
                      _currentHeight = newHeight.clamp(_minHeight, _maxHeight);
                    });
                  }
                : null,
            onVerticalDragEnd: _expanded
                ? (details) {
                    if (_currentHeight < _maxHeight / 2) {
                      _controller.reverse();
                      _expanded = false;
                    } else {
                      _expanded = true;
                      _controller.forward(from: _currentHeight / _maxHeight);
                      _currentHeight = _maxHeight;
                    }
                  }
                : null,
            child: AnimatedBuilder(
                animation: _controller,
                builder: (context, snapshot) {
                  final value =
                      ElasticInOutCurve(1.2).transform(_controller.value);
                  return Stack(
                    children: [
                      Positioned(
                        height: lerpDouble(_minHeight, _currentHeight, value),
                        left: lerpDouble(
                            size.width / 2 - menuWidth / 2, 0, value),
                        width: lerpDouble(menuWidth, size.width, value),
                        bottom: lerpDouble(40.0, 0.0, value),
                        child: GestureDetector(
                          onTapUp: (details) {
                            setState(() {
                              _expanded = true;
                              _currentHeight = _maxHeight;
                              _controller.forward(from: 0.0);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(1, 2),
                                  color: Colors.black38,
                                ),
                              ],
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(
                                    lerpDouble(20.0, 0.0, value)),
                              ),
                            ),
                            child: _expanded
                                ? Opacity(
                                    opacity: _controller.value,
                                    child: _buildExpandedContent(),
                                  )
                                : _buildMenuContent(),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget _buildExpandedContent() {
    return Container(
      margin: EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Features',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(
                          Colors.redAccent[700], Icons.live_tv, 'Live Show'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.blueAccent[700],
                          Icons.account_circle_outlined, 'My Profile'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.greenAccent[700],
                          Icons.shopping_cart_outlined, 'My Cart'),
                    ),
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.redAccent[700],
                          Icons.tap_and_play_outlined, 'Live Class'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.blueAccent[700],
                          Icons.save_outlined, 'Save Course'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.greenAccent[700], Icons.check,
                          'Purchase History'),
                    ),
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.redAccent[700],
                          Icons.menu_book_outlined, 'E-Course'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.blueAccent[700],
                          Icons.play_circle_outline, 'Recent Courses'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.grey[400], Icons.store_outlined,
                          'Marketplace'),
                    ),
                  ],
                ),
                SizedBox(width: 24),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(Colors.redAccent[700],
                          Icons.public_outlined, 'Community'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: IconCard(
                          Colors.blueAccent[700], Icons.list, 'My List'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 40,
          height: 2.5,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconCard(Colors.redAccent[700], Icons.live_tv, 'Live Show'),
            IconCard(Colors.redAccent[700], Icons.tap_and_play_outlined,
                'Live Class'),
            IconCard(
                Colors.redAccent[700], Icons.menu_book_outlined, 'E-Course'),
            IconCard(Colors.redAccent[700], Icons.public_outlined, 'Community'),
          ],
        ),
      ],
    );
  }
}
