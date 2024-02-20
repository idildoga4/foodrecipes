import 'package:flutter/material.dart';
import 'package:foodrecipes/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';

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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:ColorPalette().scaffoldBg,
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
            )
            ),
          ]
        )
       )
    );
  }
}