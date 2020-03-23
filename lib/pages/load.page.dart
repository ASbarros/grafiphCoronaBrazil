import 'package:covid19/models/country.model.dart';
import 'package:covid19/models/world.model.dart';
import 'package:covid19/pages/home.page.dart';
import 'package:covid19/widgets/customdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadPage extends StatefulWidget {
  LoadPage({Key key}) : super(key: key);

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(120, 0, 0, 255),
        //backgroundColor: Color(0xff308e1c),

        title: Text('Acompanhando o COVID-19'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Atualizar'),
          onPressed: () async {
            try {
              Show.showLoadingDialog(context);
              World world = await World.getWorld();
              Country country = await Country.getCountry('brazil');
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (cont) => HomePage(
                    title: 'titulo',
                    world: world,
                    country: country,
                  ),
                ),
              );
            } catch (e){}
          },
        ),
      ),
    );
  }
}
