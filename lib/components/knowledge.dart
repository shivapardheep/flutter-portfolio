import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Knowledge extends StatelessWidget {
  const Knowledge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(children: [
            SvgPicture.asset("assets/icons/check.svg"),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                "REST - Api Develop & Integration",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(children: [
            SvgPicture.asset("assets/icons/check.svg"),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                "Sql query & Mysql Database",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(children: [
            SvgPicture.asset("assets/icons/check.svg"),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                "MongoDB database knowledge",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
