///CRIAÇÃO DE TABELA E ELEMENTOS NO BD
//     final empresas = <String, String> {
//       "nome": "TESTE $count",
//       "estado": "ESTADO $count",
//       "pais": "PAIS $count"
//     };
// Inserção no BD
//     db
//         .collection('empresas')
//         .doc('empresa$count')
//         .set(empresas).onError(
//             (error, stackTrace) => print("Erro no firebase"));



//int count = 0;
//
//   void decrement() {
//     setState(() {
//       count--;
//     });
//   }
//
//   void increment() {
//     setState(() {
//       count++;
//     });
//
//   }
//
//   bool get isEmpty => count == 0;
//   bool get isFull => count == 20;

//     Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             isFull ? 'Lotado' : 'Pode entrar',
//             style: const TextStyle(
//                 fontSize: 30, color: Colors.white, fontWeight: FontWeight.w800),
//           ),
//           const SizedBox(height: 30,),
//           Text(
//             count.toString(),
//             style: TextStyle(
//               fontSize: 100,
//               color: isFull ? Colors.red: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 40,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: isFull ? null : increment,
//                 style: TextButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
//                     fixedSize: const Size(30, 30),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24)
//                     )
//                 ),
//                 child: const Text(
//                   'Entrou', style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//                 ),
//               ),
//               const SizedBox(width: 20,),
//               TextButton(
//                 onPressed: isEmpty ? null : decrement,
//                 style: TextButton.styleFrom(
//                     backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
//                     fixedSize: const Size(30, 30),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(24)
//                     )
//                 ),
//                 child: const Text(
//                   'Saiu', style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//                 ),
//               ),
//             ],
//           )
//         ]
//         ,
//       )
//       ,
