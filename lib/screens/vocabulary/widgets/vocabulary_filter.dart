import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/models.dart';

class VocabularyFilter extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const VocabularyFilter({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      const FilterOption(id: 'all', label: 'All', icon: Icons.all_inclusive),
      ...VocabularyCategory.allCategories.map((cat) => FilterOption(
        id: cat.id,
        label: cat.name,
        icon: cat.icon,
        color: cat.color,
      )),
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final option = categories[index];
          final isSelected = selectedFilter == option.id;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    option.icon,
                    size: 16,
                    color: isSelected ? Colors.white : (option.color ?? Colors.grey),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    option.label,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                ],
              ),
              selected: isSelected,
              onSelected: (_) => onFilterSelected(option.id),
              selectedColor: option.color ?? AppTheme.primaryColor,
              checkmarkColor: Colors.white,
              labelStyle: GoogleFonts.inter(
                fontSize: 12,
                color: isSelected ? Colors.white : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FilterOption {
  final String id;
  final String label;
  final IconData icon;
  final Color? color;

  const FilterOption({
    required this.id,
    required this.label,
    required this.icon,
    this.color,
  });
}
