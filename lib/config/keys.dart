// * # Q U E E N  👑
import 'package:almanhaj/local_storage/local_storage.dart';
import 'package:almanhaj/screens/student_class_select/page/card_selection/model/model.dart';

class KeysConfig {
  KeysConfig._();

  //* constant data
  static const selectStage ="اختر الصفوف التي ترغب في دراستها";
  static const selectMore = "(يمكنك اختيار أكثر من صف )";
  static const token ='SelectedStagesClasses';



}

class GetSelectedList{
  static List<Classes> getList(){
    final map2 = LocalStorage.getMap(KeysConfig.token);
    final List<Classes> selectedClassesList =[];
    map2.forEach((key, value) {
      selectedClassesList.add(Classes(id: int.parse(key), name: value));
    });
    return selectedClassesList;
  }
}
