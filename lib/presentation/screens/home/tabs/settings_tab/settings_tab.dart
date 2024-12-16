import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Placeholder(
      color: Colors.red,
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:news_app/core/assets_manager.dart';
// import 'package:news_app/core/colors_manager.dart';
//
// class Settings extends StatefulWidget {
//   const Settings({Key? key}) : super(key: key);
//
//   @override
//   State<Settings> createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends State<Settings> {
//   String selectedLanguage = 'English';
//   final List<String> languages = ['English', 'Arabic'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: ColorsManager.green,
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           onPressed: () {
//           },
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: ColorsManager.white,
//           image: DecorationImage(
//             image: AssetImage(AssetsManager.bgPattern),
//             fit: BoxFit.cover,
//             opacity: 0.7,
//           ),
//         ),
//         child: Padding(
//           padding: REdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Language',
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.bold,
//                   color: ColorsManager.grey,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Container(
//                 padding: REdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: ColorsManager.green, width: 2),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 child: DropdownButton<String>(
//                   value: selectedLanguage,
//                   isExpanded: true,
//                   icon: const Icon(Icons.arrow_drop_down),
//                   iconSize: 24.sp,
//                   underline: const SizedBox(),
//                   items: languages
//                       .map((language) => DropdownMenuItem<String>(
//                     value: language,
//                     child: Text(language),
//                   ))
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       selectedLanguage = value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:news_app/core/assets_manager.dart';
// import 'package:news_app/core/colors_manager.dart';
//
// class Settings extends StatefulWidget {
//   const Settings({Key? key}) : super(key: key);
//
//   @override
//   State<Settings> createState() => _SettingsScreenState();
// }
//
// class _SettingsScreenState extends State<Settings> {
//   String selectedLanguage = 'English';
//   final List<String> languages = ['English', 'Arabic'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Settings',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: ColorsManager.green,
//         centerTitle: true,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           onPressed: () {
//           },
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: ColorsManager.white,
//           image: DecorationImage(
//             image: AssetImage(AssetsManager.bgPattern),
//             fit: BoxFit.cover,
//             opacity: 0.7,
//           ),
//         ),
//         child: Padding(
//           padding: REdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Language',
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.bold,
//                   color: ColorsManager.grey,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Container(
//                 padding: REdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: ColorsManager.green, width: 2),
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//                 child: DropdownButton<String>(
//                   value: selectedLanguage,
//                   isExpanded: true,
//                   icon: const Icon(Icons.arrow_drop_down),
//                   iconSize: 24.sp,
//                   underline: const SizedBox(),
//                   items: languages
//                       .map((language) => DropdownMenuItem<String>(
//                     value: language,
//                     child: Text(language),
//                   ))
//                       .toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       selectedLanguage = value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
