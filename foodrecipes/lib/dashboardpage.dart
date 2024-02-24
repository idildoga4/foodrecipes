import 'package:flutter/material.dart';
import 'package:foodrecipes/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';


class DashBoardPage extends StatefulWidget
{
  const DashBoardPage({super.key});
  @override
  State<DashBoardPage> createState() =>_DashboardPageState();

}
class _DashboardPageState extends State<DashBoardPage>
{
  final List<String> RecipeTypes= 
  [
    'Tatlı',
    'Salata',
    'Günlük',
    'Kahvaltılık'
  ];

  int counter=-1;
  String selectedItem='Tatlı';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:ColorPalette().scaffoldBg,
       bottomNavigationBar: _buildBottomBar(),
       body:SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [GestureDetector(
                  onTap:() {
                    
                  },
                  child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F242C),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Iconify(HeroiconsSolid.view_grid,
                          size: 12.0, color: Color(0xFF4D4F52)),
                    ),
                  ),
                  
              ],
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
              child: Text('Sizin için en iyi tarifler',
                  style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40.0)),
            ),
            SizedBox(height:20.0,),
            SearchBar(),
            SizedBox(height: 20.0),
            Padding(padding:EdgeInsets.only(left:15.0,right:15.0,top:15.0),
            child:ShaderMask(shaderCallback: (Rect bounds)
            {
              return LinearGradient(
              begin:Alignment(0.7,-1.0),
              end:Alignment(1.0,-1.0),
              colors: <Color>[Colors.black,Colors.transparent]).createShader(bounds);
            }, 
            blendMode:BlendMode.dstATop,
            child:Container(
              color:Colors.black,
              width: MediaQuery.of(context).size.width-20.0,
              child:ListView(
                scrollDirection: Axis.horizontal,
                children: [...RecipeTypes.map((e) {
                  counter++;
                  if(counter<=3) return _buildTypes(e,counter);
                  else
                  {
                    counter=0;
                    return _buildTypes(e,counter);
                  }
                }).toList()],
              )
            )
            )
            ),
          ]
        )
       )
    );
  }
  Widget _buildTypes(recipe, counter)
  {
    return Padding(padding:counter !=0 ? 
    EdgeInsets.only(left:25.0):
     EdgeInsets.only(left:7.0),
     child:Container(
      height: 50.0,
     color:Colors.black,
     child:Column(
      children: [
        GestureDetector(
          onTap:(){
            setState(() {
              selectedItem=recipe;
            });
          },
child:Text(recipe,
style:GoogleFonts.sourceSans3(
  fontWeight:FontWeight.bold,
  color:recipe==selectedItem?
  ColorPalette().recipeSelected: ColorPalette().recipeUnselected,
  fontSize:17.00
)),
        ),
        SizedBox(height:4.0),
        Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(4.0),
            color:recipe==selectedItem?ColorPalette().recipeSelected:Colors.transparent
          ),
        )
      ],
     )
     ),
     );
  }
  Widget _buildBottomBar()
  {
    return Container(
padding:EdgeInsets.only(left:25.0,right:25.0),
height:50.0,
decoration: BoxDecoration(
  color:Color(0xFF1A1819),
),
child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Container(
    child:Icon(Icons.home_filled,
    color:Color.fromARGB(255, 117, 31, 74),)
  ),
  Iconify(Ph.handbag_fill,
  color:Color(0xFF4E4F53)),
  Iconify(Ri.heart_2_fill,
  color:Color(0xFF4E4F53)),
  
],)
    );
  }
}