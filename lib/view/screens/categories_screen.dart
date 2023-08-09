import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/cubit/category_cubit.dart';

class categoriesScreen extends StatefulWidget {
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit=context.read<CategoryCubit>();
    return Scaffold(
      backgroundColor: Color(0xffC8B1E6),
      body: SafeArea(
        child: BlocBuilder<CategoryCubit, CategoryState>(
  builder: (context, state) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu,size: 30,),
                  SizedBox(width: 20,),
                  Container(
                     height: 50,
                     width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                    ),

                    child: TextFormField(

                      onTap: (){},
                      decoration: InputDecoration(

                        hintText: '  search...',
                        suffixIcon: const Icon(Icons.search,color: Colors.grey,size: 30,),
                        enabledBorder: OutlineInputBorder(

                         borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                            color:  Color(0xffC8B1E6)

                            )

                        ),

                        focusedBorder:  OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25),

                        ),
                        focusColor: Colors.grey
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.wb_sunny_outlined,size: 30,color: Colors.black,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Categories",style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: ListView.separated(

                  itemCount: cubit.categories.length,
                  itemBuilder: (context,index)=> Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(

                              image:AssetImage(cubit.categories[index]["image"],),
                              fit: BoxFit.fill
                          )

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.health_and_safety,size: 30,),
                            SizedBox(width: MediaQuery.of(context).size.width*.02,),
                            Text(cubit.categories[index]["title"],style: const TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ), separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 20,) ;},),
            ),

          ],
        );
  },
),
      ),
    );
  }
}
