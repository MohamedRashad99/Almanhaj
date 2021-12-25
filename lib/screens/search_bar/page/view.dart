import 'package:almanhaj/screens/all_sections_notes/page/views/lesson_of_card.dart';
import 'package:almanhaj/screens/components/constants.dart';
import 'package:almanhaj/screens/components/customTextFeild.dart';
import 'package:almanhaj/screens/search_bar/cubit/search_cubit.dart';
import 'package:almanhaj/screens/search_bar/page/views/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
                  CustomTextField(
                    hint: 'البحث',
                    icon: Icons.lock_outline,
                    dIcon: Icons.lock_outline,
                    type: TextInputType.text,
                    onsave: (value) {
                      SearchCubit.of(context)
                          .getSearchResult(words: value.toString());
                    },
                  ),
                  if (state is SearchLoading)
                    const Center(
                        child: SpinKitChasingDots(
                      color: kPrimaryBlueColor,
                      size: 40,
                    )),
                  if (state is SearchIsEmpty)
                    const Center(child: Text(" لا يوجد نتائج الاّن "),),
                  if (state is SearchSuccess)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.searchModel.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return SearchCard(
                              id: state.searchModel[index].id,
                              title1: state.searchModel[index].title,
                              image: "assets/image/logo2021.png");
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
}
