part of '../cp_event_item.dart';

enum EventStatutsEnum {
  ended,
  coming,
  progessing,
}

class CPEventItemConfigs {
  final ClanEventEntity data;
  const CPEventItemConfigs({
    required this.data,
  });

  EventStatutsEnum get status$ {
    if (data.startDate == null || data.endDate == null) {
      return EventStatutsEnum.ended;
    }
    if (data.startDate!.isAfter(DateTime.now())) {
      return EventStatutsEnum.coming;
    } else if (data.startDate!.isBefore(DateTime.now()) &&
        data.endDate!.isAfter(DateTime.now())) {
      return EventStatutsEnum.progessing;
    }
    return EventStatutsEnum.coming;
  }


  String toStatusString() {
    switch (status$) {
      case EventStatutsEnum.progessing:
        return "Đang diễn ra";
        case EventStatutsEnum.coming:
        return "Sắp diễn ra";
      case EventStatutsEnum.ended:
        return "Đã kết thúc";
    }
  }
}
