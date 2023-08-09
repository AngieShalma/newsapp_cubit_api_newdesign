import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project_newsapp/cubit/news_api_cubit.dart';

import '../../cubit/category_cubit.dart';

class newsScreen extends StatelessWidget {
  const newsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<CategoryCubit>();
  return BlocBuilder<CategoryCubit, CategoryState>(
  builder: (context, state) {
    return Column(
    children: [
      ListView.separated(
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                child: Row(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height*0.17,
                        width: MediaQuery.of(context).size.width*0.3,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder:"images/placeholper_image.jpg",
                          fit: BoxFit.cover,
                          image: "${cubit.datalist[index]["urlToImage"]}",
                          imageErrorBuilder: (a,b,c){
                            return Image.asset("images/placeholper_image.jpg");
                          },
                        )
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${context.read<NewsApiCubit>().datalist[index]["title"]}",overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: provider.colortext),maxLines: 3,),
                          Text("${context.read<NewsApiCubit>().datalist[index]["publishedAt"]}",
                            style: TextStyle(fontSize: 15,color: cubit.colorDate),)

                        ],),
                    )
                  ],
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>web_screen(
                      url: context.read<NewsApiCubit>().datalist[index]["url"],
                      title: context.read<NewsApiCubit>().datalist[index]["title"])));
                },
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider(color:provider.colortext
            );
          }, itemCount: Provider.of<dataprovider>(context).datalist.length),
    ],
  );
  },
);
  }
}
