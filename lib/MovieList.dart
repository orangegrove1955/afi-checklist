import 'package:flutter/material.dart';

Widget MovieList(List movieList) {
  return ListView.builder(
    itemCount: movieList.length,
    itemBuilder: (context, index) {
      final movie = movieList[index];
      return Card(
        child: ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.description),
          leading: Text((index+1).toString()),
          trailing: Checkbox(
            value: movie.watched,
            onChanged: (valueInput)=> {},
          ),
          onTap: () => debugPrint("Go to movie"),
        ),
      );
    },
  );
}
