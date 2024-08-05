import 'package:dalalah/src/main_index.dart';
import '../../../../real_estate/data/models/my_properties_response.dart';
import '../../../../real_estate/presentation/real_estate/widgets/real_estate_item.dart';

class MyRealEstateScreen extends BaseStatelessWidget {
  final List<Property> properties;
  final bool isMyProperty;
  final bool isHidePayment;
  final Function(int)? onToggleFavorite;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  final Function(int)? onRequestPrice;
  final Function(int)? onDelete;
  final Function(int)? onUpdateDate;
  MyRealEstateScreen({super.key,required this.properties,this.isMyProperty =false, this.isHidePayment=false, this.onToggleFavorite, this.onHide, this.onSold, this.onSpecial,this.onRequestPrice, this.onDelete, this.onUpdateDate, });
  double sliderValue=20000;
  double sliderValue2=1200;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingHoriz,
      child: ListView.builder(
          itemCount: properties.length,
          itemBuilder: (context,index){
           return RealStateItemWidget(
             realEstate: properties[index],
             isMyProperty: isMyProperty,
             onToggleFavorite: onToggleFavorite,
             onHide: onHide,
             onSold: onSold,
             onSpecial: onSpecial,
             onRequestPrice: onRequestPrice,
             onDelete: onDelete,
             isHidePayment: isHidePayment,
             onUpdateDate: onUpdateDate,
           );
      })
    );
  }
}
