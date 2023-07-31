import 'package:flutter/material.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       
         elevation: 0,
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios),
          color:Color.fromRGBO(228, 187, 5, 1),
          onPressed:(){Navigator.pop(context);}, ),    
        title:
                   Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                     children: [ Text(      
                                 'عن التطبيق', 
                                 style: TextStyle(
                                   color: Color.fromRGBO(228, 187, 5, 1),
                                   fontSize: 25,
                                   fontWeight: FontWeight.bold,    
                                 ),
                               ),
                               
                               SizedBox(width: 20.0),
                            ]    ),  
        backgroundColor: Colors.white,  
        ),
        body:Container(
          margin: EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                 Text('GOLD',
                style:TextStyle(
                  fontSize:25,
                  fontWeight: FontWeight.bold,
                  color:Color.fromRGBO(228, 187, 5, 1),  ),
                     ),

              SizedBox(height:30),
               
               Text(
                 'هو تطبيق إلكتروني لبيع الذهب في قطاع غزة يهدف التطبيق إلى التسهيل على أصحاب المحلات و الزبائن فهو يوفر طريقة سهلة و ممتعة للطرفين و يوفر لك التطبيق تجربة تسوق ممتعة و مميزة و أيضا يمكنك النظر إلى آخر المستجدات في الذهب ',
              
               textDirection: TextDirection.rtl,
               
               style:TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.normal,
                  color:Color.fromRGBO(228, 187, 5, 1),            
                   ),
                    ),
                     
               ], ),
          ),
        ),
       
        backgroundColor: Colors.white,
        
        
    );
  }
}

