import 'package:burcprojesi/BurcDetay.dart';
import 'package:burcprojesi/model/burc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc ,super.key});

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(builder: (context) => BurcDetay(secilenBurc: listelenenBurc)));
          },
          leading: Image.asset("image/" + listelenenBurc.burcKucukResim,),

          title: Text(listelenenBurc.burcAdi,style: myTextStyle.headline5,),

          subtitle: Text(listelenenBurc.burcTarihi, style: myTextStyle.subtitle1),

          trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink,),
        ),
      ),
    );
  }
}