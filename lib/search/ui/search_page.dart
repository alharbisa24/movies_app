import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:movies/core/helpers/spacing.dart';
import 'package:movies/core/helpers/locales/app_locale.dart';
import 'package:movies/search/logic/cubit/search_cubit.dart';
import 'package:movies/search/ui/search_bloc_builder.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().loadSearchHistory();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    
    _debounce = Timer(const Duration(seconds: 3), () {
      if (query.isNotEmpty) {
        context.read<SearchCubit>().searchMovies(query);
      } else {
        context.read<SearchCubit>().searchMovies('');
      }
    });
  }

  void _onSearchHistoryTap(String query) {
    _searchController.text = query;
    context.read<SearchCubit>().searchMovies(query);
  }

  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? Colors.grey.shade900 : Colors.white;
    final iconColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:
                     HugeIcon(
                      icon: _localization.currentLocale == Locale('en') ? HugeIcons.strokeRoundedArrowLeft02 : HugeIcons.strokeRoundedArrowRight02,
                      color: iconColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      AppLocale.search.getString(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: iconColor,
                      ),
                    ),
                  ),
                  horizontalSpace(30),
                ],
              ),
              verticalSpace(24),
              SearchInput(
                placeholder: AppLocale.search_placeholder.getString(context),
                controller: _searchController,
                onChanged: _onSearchChanged,
              ),
              verticalSpace(24),
              Expanded(
                child: SearchBlocBuilder(
                  onHistoryTap: _onSearchHistoryTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String placeholder;
  final Function(String)? onChanged;

  const SearchInput({
    Key? key,
    this.controller,
    this.validator,
    required this.placeholder,
    this.onChanged,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final borderColor = isDark ? Colors.grey.shade600 : Colors.grey.shade300;
    final iconColor = isDark ? Colors.grey.shade400 : Colors.grey.shade800;
    final textColor = isDark ? Colors.white : Colors.black;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        children: [
          horizontalSpace(15),
          Icon(
            Icons.search,
            color: iconColor,
          ),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              onChanged: widget.onChanged,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                isCollapsed: false,
                isDense: false,
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: isDark ? Colors.grey.shade500 : Colors.grey,
                  fontSize: 12.sp,
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
                filled: true,
                fillColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide: BorderSide(
                    color: Color(0xFFF7F8F8),
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          horizontalSpace(15),
        ],
      ),
    );
  }
}

