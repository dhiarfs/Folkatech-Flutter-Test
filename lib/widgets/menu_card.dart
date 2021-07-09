part of 'widgets.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;

  MenuCard(this.menu);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => DetailPage(menu),
          ),
        );
      },

      //Membuat custom widget yang berisi data dari model menu (name, cover, price)
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 160,
          width: 140,
          decoration: BoxDecoration(
            color: Color(0xffF6F7F8),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: (2),
                offset: Offset(1, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    menu.cover,
                    width: 140,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  menu.name,
                  style: regularBlackFont.copyWith(fontSize: 10),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  "Rp. " + (menu.price).toString(),
                  style: extraBlackFont.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
