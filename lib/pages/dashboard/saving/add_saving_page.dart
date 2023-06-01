import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallet_app/components/c_elevated_button.dart';

import '../../../components/c_text_form_field.dart';
import '../../../components/multiline_text_field.dart';
import '../../../utils/constants.dart';

class AddSavingPage extends StatefulWidget {
  const AddSavingPage({super.key});

  @override
  State<AddSavingPage> createState() => _AddSavingPageState();
}

class _AddSavingPageState extends State<AddSavingPage> {
  int total = 1200;
  File? _image;
  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffoldColor,
        leadingWidth: 100.w,
        title: Text(
          'Saving',
          style: mediumTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 20.r,
          ),
        ),
      ),
      body: RPadding(
        padding: REdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Savings',
                style: mediumTextStyle,
              ),
              SizedBox(
                height: 16.h,
              ),
              CTextFormField(
                hintText: 'Name',
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: Container(
                  width: 240.w,
                  height: 240.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F6),
                      borderRadius: BorderRadius.all(Radius.circular(6.r))),
                  child: Stack(
                    children: [
                      _image != null
                          ? Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Image.file(
                                _image!,
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            )
                          : Positioned(
                              top: 20.h,
                              left: 20.w,
                              right: 20.w,
                              child: const Text('Please select an image')),
                      Positioned(
                          top: 99.h,
                          left: 51.w,
                          right: 51.w,
                          child: SizedBox(
                            width: 140.w,
                            child: CElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      color: whiteColor,
                                    ),
                                    Text(
                                      'Add Picture',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: whiteColor,
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  _openImagePicker();
                                }),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                'Amount',
                style: mediumTextStyle,
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                padding:
                    REdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F6),
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: ListTile(
                  contentPadding: REdgeInsets.all(0),
                  title: Text(
                    '\$$total|',
                    style: heading2,
                  ),
                  trailing: SizedBox(
                    width: 70.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            total > 0 ? total-- : total;
                            setState(() {});
                          },
                          child: Container(
                            padding: REdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.r))),
                            child: const Icon(
                              Icons.remove,
                              color: whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              total++;
                            });
                          },
                          child: Container(
                            padding: REdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.r))),
                            child: const Icon(
                              Icons.add,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                'Description',
                style: mediumTextStyle,
              ),
              SizedBox(
                height: 16.h,
              ),
              MultilineTextField(
                hintText: 'Letsgo this year!!',
                minLines: 2,
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                  width: double.infinity,
                  child: CElevatedButton(
                      child: const Text('Add Saving'), onPressed: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
