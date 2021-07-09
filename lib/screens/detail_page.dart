part of 'screens.dart';

class DetailPage extends StatefulWidget {
  final Menu menu;

  DetailPage(this.menu);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          },
        ),
        centerTitle: true,
        title: Text("Detail Product"),
        backgroundColor: maroonColor,
      ),
      backgroundColor: whiteColor,

      //Membuat sebuah layar yang di styling menggunakan data yang ada pada model Menu (name, price, cover, desc)
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '${widget.menu.cover}',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 24),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  width: MediaQuery.of(context).size.width - 2 * 24,
                  decoration: BoxDecoration(
                    color: Color(0xffF6F7F8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: (2),
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.menu.name}'.toUpperCase(),
                            style: semiBlackFont.copyWith(fontSize: 18)),
                        Text('Rp. ${widget.menu.price}',
                            style: regularGreyFont.copyWith(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: boldBlackFont.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 6),
                      Text('${widget.menu.desc}',
                          style: lightBlackFont.copyWith(fontSize: 12),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
