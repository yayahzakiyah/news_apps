import 'package:flutter/material.dart';

class HomeTrending extends StatelessWidget {
  const HomeTrending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trending', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),),
              Text('See all', style: TextStyle(fontSize: 14, color: Colors.grey),)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5, top: 5),
            child: Text('Europe', style: TextStyle(fontSize: 13, color: Colors.grey)),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            child: Text('Rusian warship: Moskva sinks in Black Sea', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          ),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
              SizedBox(width: 5,),
              Text('BBC News', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              SizedBox(width: 10,),
              Icon(Icons.schedule_rounded, size: 13, color: Colors.grey,),
              SizedBox(width: 2,),
              Text('4h ago', style: TextStyle(fontSize: 13, color: Colors.grey,)),
            ],
          )
        ],
      ),
    );
  }
}
