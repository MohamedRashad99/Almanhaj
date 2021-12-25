import 'package:almanhaj/screens/all_sections_notes/page/views/lesson_of_card.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/customTextFeild.dart';
import 'package:almanhaj/screens/components/customTextFeildAlmanhaj.dart';
import 'package:almanhaj/screens/home_screen/view.dart';
import 'package:almanhaj/screens/search_bar/cubit/search_cubit.dart';
import 'package:almanhaj/screens/search_bar/page/views/search_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: searchTextField(context),
                  ),

                  if (state is SearchLoading)
                    const Center(
                        child: SpinKitChasingDots(
                      color: kPrimaryBlueColor,
                      size: 40,
                    )),
                  if (state is SearchIsEmpty)
                    const Center(
                      child: Text(
                        " لا يوجد نتائج الاّن ",
                        style: TextStyle(fontSize: 14, color: Colors.black, fontFamily: "Khebrat Musamim"),
                      ),
                    ),
                  if (state is SearchSuccess)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.searchModel.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return SearchCard(id: state.searchModel[index].id, title1: state.searchModel[index].title, image: "assets/image/logo2021.png");
                        },
                      ),
                    ),
                  if (state is SearchError) Center(child: Text(state.msg)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  TextFormField searchTextField(BuildContext context) {
    return TextFormField(
                    style: const TextStyle(fontSize: 14, color: kGreyTextColor, fontFamily: "Khebrat Musamim"),
                    keyboardType: TextInputType.text,
                    keyboardAppearance: Brightness.light,
                    textInputAction: TextInputAction.search,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'البحث',

                      prefixIcon: IconButton(
                          onPressed: ()=>Get.back(),
                          icon: const Icon(FontAwesomeIcons.angleLeft,color: kPrimaryColor,size: 22,)),

                      suffixIcon: const Icon(
                        FontAwesomeIcons.search,
                        color: kPrimaryColor,
                        size: 18,
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontFamily: "Khebrat Musamim",
                      ),
                      hintStyle: const TextStyle(fontSize: 14, color: kTextColor, fontFamily: "Khebrat Musamim"),
                      // filled: true,
                      fillColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      SearchCubit.of(context).getSearchResult(words: value.toString());
                    },
                  );
  }
}
