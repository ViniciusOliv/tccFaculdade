import '../domain/entities/etiqueta.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class EtiquetaDetailsBack{
  BuildContext context;
  Etiqueta etiqueta;

  EtiquetaDetailsBack(this.context){
    etiqueta = ModalRoute.of(context).settings.arguments as Etiqueta;
  }

  goToBack(){
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async{
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError){
    _launchApp('tel:${etiqueta.lote}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError){
    _launchApp('sms:${etiqueta.lote}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError){
    _launchApp('mailto:${etiqueta.lote}', showModalError);
  }
}