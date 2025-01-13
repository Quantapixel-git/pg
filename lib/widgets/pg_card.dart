import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';

class PgCard extends StatelessWidget {
  final String name;
  final String address;
  final String imageUrl;
  final VoidCallback? onTap;

  const PgCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.address,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.black.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      address,
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.gray,
                      ),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text("4.2")
                      ],
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
