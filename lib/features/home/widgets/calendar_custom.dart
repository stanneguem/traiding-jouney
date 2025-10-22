import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  final Color rangeColor; // Couleur du fond entre les deux dates
  final Color startColor; // Couleur de la date de début
  final Color endColor;   // Couleur de la date de fin

  const CustomCalendar({
    super.key,
    required this.rangeColor,
    required this.startColor,
    required this.endColor,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime selectedMonth = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  Set<DateTime> excludedDates = {};

  List<DateTime> getDaysInMonth(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final lastDay = DateTime(date.year, date.month + 1, 0);
    return List.generate(lastDay.day, (index) => DateTime(date.year, date.month, index + 1));
  }

  bool isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  void changeMonth(int offset) {
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + offset, 1);
    });
  }

  void selectDate(DateTime date) {
    setState(() {
      // Cas 1 : si aucun point sélectionné
      if (startDate == null) {
        startDate = date;
        endDate = null;
        excludedDates.clear();
        return;
      }

      // Cas 2 : si une date déjà choisie
      if (startDate != null && endDate == null) {
        // Si l'utilisateur reclique sur la même date
        if (isSameDate(startDate!, date)) {
          startDate = null;
          excludedDates.clear();
          return;
        }

        // Sinon, on définit la fin (peu importe si avant ou après)
        if (date.isBefore(startDate!)) {
          endDate = startDate;
          startDate = date;
        } else {
          endDate = date;
        }
        return;
      }

      // Cas 3 : si deux dates déjà choisies → on réinitialise
      if (startDate != null && endDate != null) {
        // Si le clic est dans l'intervalle -> toggle exclusion
        if (date.isAfter(startDate!) && date.isBefore(endDate!)) {
          if (excludedDates.any((d) => isSameDate(d, date))) {
            excludedDates.removeWhere((d) => isSameDate(d, date));
          } else {
            excludedDates.add(date);
          }
          return;
        }

        // Si le clic est sur le début
        if (isSameDate(date, startDate!)) {
          startDate = endDate;
          endDate = null;
          return;
        }

        // Si le clic est sur la fin
        if (isSameDate(date, endDate!)) {
          endDate = null;
          return;
        }

        // Sinon : on redéfinit une nouvelle sélection
        startDate = date;
        endDate = null;
        excludedDates.clear();
      }
    });
  }

  bool isInRange(DateTime date) {
    if (startDate == null || endDate == null) return false;
    return (date.isAfter(startDate!) && date.isBefore(endDate!));
  }

  @override
  Widget build(BuildContext context) {
    final days = getDaysInMonth(selectedMonth);
    final firstWeekday = days.first.weekday;
    final weeks = (days.length + firstWeekday - 1) ~/ 7 + 1;

    return Dialog(
      backgroundColor: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // === Header ===
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => changeMonth(-1),
                  icon: const Icon(Icons.arrow_left, color: Colors.white),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C2C2C),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        DateFormat.MMMM().format(selectedMonth),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C2C2C),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        selectedMonth.year.toString(),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => changeMonth(1),
                  icon: const Icon(Icons.arrow_right, color: Colors.white),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // === Jours de la semaine ===
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var d in ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'])
                  Expanded(
                    child: Center(
                      child: Text(
                        d,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 8),

            // === Grille du calendrier ===
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: weeks * 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final dayIndex = index - (firstWeekday - 1);
                if (dayIndex < 0 || dayIndex >= days.length) {
                  return const SizedBox();
                }

                final day = days[dayIndex];
                bool isExcluded = excludedDates.any((d) => isSameDate(d, day));
                bool isStart = startDate != null && isSameDate(day, startDate!);
                bool isEnd = endDate != null && isSameDate(day, endDate!);
                bool inRange = isInRange(day) && !isExcluded;

                Color bgColor = const Color(0xFF2C2C2C);
                if (isStart) bgColor = widget.startColor;
                else if (isEnd) bgColor = widget.endColor;
                else if (inRange) bgColor = widget.rangeColor;

                return GestureDetector(
                  onTap: () => selectDate(day),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          color: isStart || isEnd || inRange ? Colors.white : Colors.grey[300],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // === Boutons ===
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF2C2C2C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Annuler', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    if (startDate != null && endDate != null) {
                      // On renvoie toutes les dates de l’intervalle sauf exclusions
                      List<DateTime> range = [];
                      DateTime current = startDate!;
                      while (current.isBefore(endDate!) || isSameDate(current, endDate!)) {
                        if (!excludedDates.any((d) => isSameDate(d, current))) {
                          range.add(current);
                        }
                        current = current.add(const Duration(days: 1));
                      }
                      Navigator.pop(context, range);
                    } else if (startDate != null) {
                      Navigator.pop(context, [startDate!]);
                    } else {
                      Navigator.pop(context, []);
                    }
                  },
                  child: const Text('Confirmer', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
