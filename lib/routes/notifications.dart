import 'package:flutter/material.dart';
import 'package:chindi_ke/utils/constants/sizes.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Current Text theme

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Notifications"),
        ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search notifications",
                contentPadding: const EdgeInsets.all(16.0),
                fillColor: Colors.black12,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
              return Slidable(
                endActionPane: ActionPane(
                  extentRatio: .3,
                  motion: const ScrollMotion(), 
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      icon: Icons.delete,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple[700]!,
                      ),
                  ]),
                child: ListTile(
                  isThreeLine: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Spring Cleaning",
                    style: TextStyle(
                      fontWeight: FontWeight.w600),
                      ),
                    Text("2min Ago", style: TextStyle(fontSize: ChindiSizes.fontsizess),),
                  ],
                ),
                subtitle: const Text(
                  "Nina registered to perform your task",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            }, separatorBuilder: (context, index) => Divider(
              thickness: 1.0,
              color: Colors.purple[400],
              indent: size.width * 0.08,
              endIndent: size.width * 0.08,
            ), 
            itemCount: 3,),
          ),
        ],
      ),
      ),
    );
  }
}  