part of 'widgets.dart';

class IconCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  IconCard(this.color, this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Buat sebuah Container bulat yang didalamnya berisi Icon dan dibawahnya text
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 18,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 8,
          ),
        ),
      ],
    );
  }
}
