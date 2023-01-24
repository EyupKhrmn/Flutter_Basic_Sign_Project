import 'package:burcprojesi/model/burc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required Burc this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {

  Color appbarRengi = Colors.pink;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => AppbarRenginiBul());
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: appbarRengi,
              flexibleSpace: FlexibleSpaceBar(background: Image.asset("image/" + widget.secilenBurc.burcBuyukResim,
              fit: BoxFit.cover,),
               title: Text(widget.secilenBurc.burcAdi + " Ve Özellikleri"),
              centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(children: [
                     Text(widget.secilenBurc.burcDetayi,style: Theme.of(context).textTheme.bodyText2,),
                      Text(widget.secilenBurc.burcDetayi,style: Theme.of(context).textTheme.bodyText2,)
                  ],)
                  ),
              ),
            )
          ],
        )
    );
  }

  void AppbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(AssetImage("image/${widget.secilenBurc.burcBuyukResim}"));
    appbarRengi = _generator.vibrantColor!.color;
    setState(() {
      
    });
  }
}