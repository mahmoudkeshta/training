import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:training/presentation/home_page/controller/home_controller.dart';
import 'package:training/presentation/home_page/models/home_model.dart';
import 'package:training/presentation/home_page/models/popular_bloggers.dart';

import 'controller/BloggerCard.dart';

class BloggerCard extends StatelessWidget {
  BloggerCard({
    super.key,
  });

  final BloggerCardImg controller = Get.put(BloggerCardImg());

  var arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: "${controller.Popular_bloggers.imageUrl}",
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.Popular_bloggers.bloggerName}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "${controller.Popular_bloggers.bloggerName}\n",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${controller.Popular_bloggers.paragraphText}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          controller.Popular_bloggers.paragraphText!.replaceAll('\n', ''),
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: Color.fromARGB(255, 227, 25, 25),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
