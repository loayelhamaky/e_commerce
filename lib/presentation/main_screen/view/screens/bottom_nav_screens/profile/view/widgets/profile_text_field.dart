import 'package:e_commerce_app/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../flutter_map/flutter_map.dart';

class ProfileScreenTextField extends StatefulWidget {
  final String label;
  final String value;
  final Function(String) onChanged;
  final TextInputType inputType;
  final bool resetField;
  final bool isAddress;
  const ProfileScreenTextField({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.resetField,
    this.isAddress = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  _ProfileScreenTextFieldState createState() => _ProfileScreenTextFieldState();
}

class _ProfileScreenTextFieldState extends State<ProfileScreenTextField> {
  late bool isAddress;
  late TextEditingController _controller;
  bool _isEditable = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didChangeDependencies() {
    isAddress = widget.isAddress;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.resetField) {
      _controller.clear();
      _focusNode.unfocus();
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 7.h),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                cursorColor: AppColors.primary,
                controller: _controller,
                enabled: _isEditable,
                focusNode: _focusNode,
                keyboardType: widget.inputType,
                decoration: InputDecoration(
                  hintFadeDuration: const Duration(seconds: 2),
                  hintText: widget.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  contentPadding: EdgeInsets.all(14.h),
                ),
                onChanged: (text) {
                  widget.onChanged(text);
                },
              ),
              Visibility(
                visible: !_isEditable,
                child: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    if (isAddress) {
                      LatLng? location = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapPage(),
                        ),
                      );
                      if (location != null) {
                        String locationString =
                            "${location.latitude}, ${location.longitude}";
                        widget.onChanged(locationString);
                      }
                    } else {
                      setState(() {
                        _isEditable = true;
                        _focusNode.requestFocus();
                      });
                    }
                    setState(() {
                      _isEditable = true;
                      _focusNode.requestFocus();
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
