import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/date_format.dart';
import 'package:news_app/utils/string_modifier.dart';

class HomeLatest extends StatefulWidget {
  final List<dynamic> header;
  final Function onPressCategory;
  final Function? onPressSeeAll;

  final List<NewsModel>? data;

  const HomeLatest(
      {super.key,
      required this.header,
      required this.onPressCategory,
      this.onPressSeeAll,
      this.data});

  @override
  State<HomeLatest> createState() => _HomeLatestState();
}

class _HomeLatestState extends State<HomeLatest> {
  dynamic _selectedData = 'All';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
              GestureDetector(
                child: const Text(
                  'See all',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                onTap: () {
                  widget.onPressSeeAll;
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.header.map((data) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: data == _selectedData
                              ? Color.fromRGBO(24, 119, 242, 1)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(right: 10, bottom: 5),
                    child: Text(data),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedData = data;
                    });
                    widget.onPressCategory(data);
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: widget.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 96,
                            height: 96,
                            child: widget.data![index].img != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      widget.data![index].img.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Center(child: Text('no image')),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.59,
                            height: 96,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: widget.data![index].author != null
                                        ? Text(
                                            StringModifier().cutString(
                                                widget.data![index].author
                                                    .toString(),
                                                20),
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey))
                                        : const Text(''),
                                  ),
                                  Container(
                                    child: Text(
                                      StringModifier().cutString(
                                          widget.data![index].title.toString(),
                                          50),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          StringModifier().cutString(
                                              widget
                                                  .data![index].source!['name']
                                                  .toString(),
                                              15),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Icon(
                                        Icons.schedule_rounded,
                                        size: 13,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(MyDateFormat().calculateDifferentTime(widget.data![index].time),
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.grey,
                                          )),
                                    ],
                                  )
                                ]),
                          )
                        ],
                      ));
                }),
          )
        ],
      ),
    );
  }
}
