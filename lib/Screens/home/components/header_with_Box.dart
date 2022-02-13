import 'package:flutter/material.dart';
import 'package:project_app/constants.dart';

class HeaderWithBox extends StatelessWidget {
  const HeaderWithBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: 20 + kDefaultPadding,
      ),
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * 0.2 - 30,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Row(
        children: <Widget>[
          Text(
            'RepairMan Apps',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Image(
            image: AssetImage('assets/images/repair_icon.png'),
          )
        ],
      ),
    );
  }
}
