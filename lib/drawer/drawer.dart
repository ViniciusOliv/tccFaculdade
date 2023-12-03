import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State < Home > {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Pagina Inicial',
            style: TextStyle(fontSize: 14),
          ),
          backgroundColor: const Color.fromARGB(255, 17, 15, 65),
        ),
        backgroundColor: Color.fromARGB(255, 177, 177, 238) ,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildSearchIdTextField(),
              _buildSearchCepButton()
            ],
          ),
        ),

        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildHeader(),
                  _buildItem(
                      icon: Icons.home_rounded,
                      title: 'Home',
                      onTap: ()=> Navigator.pop(context)
                  ),
                  _buildItem(
                      icon: Icons.notifications_rounded,
                      title: 'Listar Etiqueta',
                      onTap: ()=> Navigator.pushNamed(context, 'etiqueta-list')
                  ),
                  _buildItem(
                      icon: Icons.person,
                      title: 'Criar Etiqueta',
                      onTap: ()=> Navigator.pushNamed(context, 'etiqueta-form')
                  ),
                  _buildItem(
                      icon: Icons.settings,
                      title: 'Setting',
                      onTap: ()=> Navigator.pushNamed(context, 'Setting')
                  )
                ]
            )
        )
    );
  }

  Widget _buildHeader() {
    return DrawerHeader(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 17, 15, 65),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CircleAvatar(
             // backgroundImage: AssetImage('assets/images/profile-image.jpg'),
              radius: 40,
            ),
            SizedBox(height: 20, ),
            Text(
              'Usuario Nome Aqui',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
            )
          ],
        )
    );
  }

  Widget _buildItem({ IconData icon,  String title,  GestureTapCallback onTap}){
    return ListTile(
      leading: Icon(icon),
      minLeadingWidth: 5,
      title: Text(title),
      onTap: onTap,
    );

  }

  Widget _buildSearchIdTextField() {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(labelText: 'Cep'),
//      controller: _searchCepController,
 //     enabled: _enableField,

    );
  }

  Widget _buildSearchCepButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
       // onPressed: ,
//        child: _loading ? _circularLoading() : Text('Consultar'),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _circularLoading() {
    return Container(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }







}












