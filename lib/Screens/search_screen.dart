import 'package:flutter/material.dart';
import 'package:gsb_medecins/Screens/profil.dart';
import 'package:gsb_medecins/Service/api.dart';

import '../Entity/medecin.dart';
import '../constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController editingController = TextEditingController();
  var items = List<Medecin>.generate(1, (index) => Medecin(id: 0, prenom: "---", nom: "---", adresse: "---", tel: "---"));
  void filterSearchResults(String query) async {
    if(query.isNotEmpty) {
      var result = await Api().getMedecinsByNom(query);
      setState(() {
        items.clear();
        items = result;
      });
      return;
    } else {
      var result = await Api().getMedecins();
      setState(() {
        items.clear();
        items = result;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recherche des médecins par nom :'),
          /* leading: BackButton(
              color: Colors.white
          ),*/ ),
        body: Container(
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: editingController,
                    decoration: InputDecoration(
                        labelText: "Recherche",
                        hintText: "Recherche",
                        prefixIcon: Icon(Icons.search),
                        focusColor: kPrimaryColor,
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25.0)))),


                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          onTap: () {
                            Navigator.pushNamed(context,MedecinProfil.routeName, arguments: Api().getMedecinByID(items[i].id));
                          },
                          title: Text(items[i].id.toString()+" "+items[i].nom),

                          /* subtitle: Text(snapshot.data[i].prenom),
      trailing: Text(snapshot.data[i].nom),*/
                        );

                      }),
                ),
              ],
            ),
          ),
        ));
  }

}
