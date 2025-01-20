import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';
import 'package:pg/models/pg_model.dart';

class AdminPGCard extends StatelessWidget {
  final PGModel pg;
  final Function(String pgId) onDeleteTap;
  final Function(PGModel pg) onEditTap;

  const AdminPGCard({
    super.key,
    required this.pg,
    required this.onDeleteTap,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  pg.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
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
                  pg.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  pg.address,
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            children: [
              IconButton(
                onPressed: () {
                  onDeleteTap(pg.id!);
                },
                icon: Icon(
                  Icons.delete,
                  color: AppColors.danger,
                ),
              ),
              IconButton(
                onPressed: () {
                  onEditTap(pg);
                },
                icon: Icon(Icons.edit),
              ),
            ],
          )
        ],
      ),
    );
  }
}
