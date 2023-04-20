import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sivaram_portfolio_web/models/Project.dart';
import 'package:sivaram_portfolio_web/providers/firebase_projects_provider/provider.dart';
import 'package:sivaram_portfolio_web/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseProjectsProvider provider =
        context.watch<FirebaseProjectsProvider>();
    return provider.getMyProjectList.isNotEmpty
        // return false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "My Projects",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.getMyProjectList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: Responsive.isDesktop(context)
                        ? 1
                        : Responsive.isMobile(context)
                            ? 1.2
                            : 0.9,
                    crossAxisCount: Responsive.isMobileLarge(context)
                        ? 2
                        : Responsive.isMobile(context)
                            ? 1
                            : 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return ProjectContainer(
                    i: index,
                    dataList: provider.getMyProjectList,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Worked Projects",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.getWorkedProjectList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: Responsive.isDesktop(context)
                        ? 1
                        : Responsive.isMobile(context)
                            ? 1.2
                            : 0.9,
                    crossAxisCount: Responsive.isMobileLarge(context)
                        ? 2
                        : Responsive.isMobile(context)
                            ? 1
                            : 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  return ProjectContainer(
                    i: index,
                    dataList: provider.getWorkedProjectList,
                  );
                },
              ),
            ],
          )
        : Center(
            child: Lottie.asset("assets/icons/walking.json"),
          );
  }
}

class ProjectContainer extends StatelessWidget {
  final int i;
  final List dataList;

  const ProjectContainer({super.key, required this.i, required this.dataList});

  Future<void> launchUrlFun(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(dataList[i].url.toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {},
                      splashColor: primaryColor,
                      child: Container(
                        decoration: BoxDecoration(
                          color: darkColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "open source",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          dataList[i].title.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        // mainAxisAlignment:
                        // MainAxisAlignment.spaceBetween,
                        children: [
                          MiniButtonWidget(
                            image: 'assets/icons/github.svg',
                            title: 'GitHub',
                            action: () {},
                          ),
                          MiniButtonWidget(
                            image: 'assets/icons/google.svg',
                            title: 'play',
                            action: () {
                              if (dataList[i].playStore!.isNotEmpty) {
                                launchUrlFun(Uri.parse(myProjects[i].playUrl));
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// class WorkedProjectContainer extends StatelessWidget {
//   final int i;
//   final FirebaseProjectsProvider provider;
//
//   const WorkedProjectContainer(
//       {super.key, required this.i, required this.provider});
//   Future<void> launchUrlFun(Uri url) async {
//     if (await canLaunchUrl(url)) {
//       launchUrl(url, mode: LaunchMode.externalApplication);
//     } else {
//       throw Exception('Could not launch $url');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           color: secondaryColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 4,
//               child: Stack(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       image: DecorationImage(
//                           image: AssetImage(workedProject[i].image),
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: InkWell(
//                       onTap: () {},
//                       splashColor: primaryColor,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: darkColor,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.all(5),
//                           child: Text(
//                             "open source",
//                             style: TextStyle(color: primaryColor),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//                 flex: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 10),
//                         child: Text(
//                           workedProject[i].title,
//                           style: Theme.of(context).textTheme.titleMedium,
//                           overflow: TextOverflow.ellipsis,
//                           softWrap: true,
//                           maxLines: 1,
//                         ),
//                       ),
//                       Row(
//                         // mainAxisAlignment:
//                         // MainAxisAlignment.spaceBetween,
//                         children: [
//                           MiniButtonWidget(
//                             image: 'assets/icons/github.svg',
//                             title: 'GitHub',
//                             action: () {},
//                           ),
//                           MiniButtonWidget(
//                             image: 'assets/icons/google.svg',
//                             title: 'play',
//                             action: () {
//                               if (workedProject[i].playUrl.isNotEmpty) {
//                                 launchUrlFun(
//                                     Uri.parse(workedProject[i].playUrl));
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MiniButtonWidget extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback action;

  const MiniButtonWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: action,
        child: Container(
          decoration: BoxDecoration(
            color: darkColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              child: Row(
                children: [
                  SvgPicture.asset(
                    image,
                    height: 15,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12, color: primaryColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
