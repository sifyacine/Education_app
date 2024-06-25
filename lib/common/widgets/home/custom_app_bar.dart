import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      this.title,
      this.onPressedSearch,
      this.onPressedNotification,
      this.onPressedProfil});
  final String? title;
  final void Function()? onPressedSearch;
  final void Function()? onPressedNotification;
  final void Function()? onPressedProfil;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: IconButton(
              iconSize: 30,
              color: Color.fromARGB(255, 92, 91, 91),
              onPressed: onPressedProfil,
              icon: const Icon(Icons.person_2_outlined)),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
                prefixIconColor: Colors.grey,
                suffixIconColor: Colors.grey,
                hintText: title,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color.fromARGB(255, 129, 129, 129)),
                prefixIcon: IconButton(
                    onPressed: onPressedSearch, icon: const Icon(Icons.search)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[200]),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: IconButton(
              iconSize: 30,
              color: Color.fromARGB(255, 102, 101, 101),
              onPressed: onPressedNotification,
              icon: const Icon(Icons.notifications_on_outlined)),
        )
      ]),
    );
  }
}
