import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 52.h,
                width: 343.w,
                child: CupertinoSearchTextField( 
                  placeholder: "ابحث عن استشاري..".tr(), 
                  placeholderStyle: TextStyle(color: Colors.grey),
                  backgroundColor: const Color.fromARGB(0, 126, 31, 31),
                ),
              ),
    );
  }
}
