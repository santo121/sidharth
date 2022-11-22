import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/User%20RC%20details/user_vehicle_number_controller.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/user_home_screen.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class Number extends StatelessWidget {
  const Number({super.key});
// final String userId;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserVehicleNumberController>(
      builder: (context,myModel,child) {
        return Padding(
            padding: const EdgeInsets.all(35),
            child: ListView.builder(
              itemCount: myModel.rcModelList.length,
              itemBuilder: (context,index){
              return ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserHomeScreen(userId:myModel.rcModelList[index].rcId,vehicleNumber:myModel.rcModelList[index].userVehicleNumber ),
                      ));
                    },
                    child: Text(myModel.rcModelList[index].userVehicleNumber));
            })
            
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     ElevatedButton(
            //         onPressed: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) => UserHomeScreen(userId: userId),
            //           ));
            //         },
            //         child: const Text("KL 08 BC541")),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     ElevatedButton(onPressed: () {}, child: const Text("KL 08 BC7565"))
            //   ],
            // )
            );
      }
    );
  }
}
