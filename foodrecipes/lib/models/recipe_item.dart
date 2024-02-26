class RecipeItem
{
  String? itemImg;
  String? title;
  String? subtitle;
  double? rating;

  RecipeItem({this.itemImg,this.title,this.subtitle,this.rating});

RecipeItem.fromJson(Map<String,dynamic> json)
{
  itemImg=json['itemImg'];
  title=json['title'];
  subtitle=json['subtitle'];
  rating=json['rating'];
}
Map<String,dynamic>toJson()
{
  final Map<String,dynamic>data=new Map<String,dynamic>();
  data['itemImg']=this.itemImg;
  data['title']=this.title;
  data['subtitle']=this.subtitle;
  data['rating']=this.rating;
  return data;
}
}