// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "app_bar_title" : MessageLookupByLibrary.simpleMessage("Список задач"),
    "bottom_navbar_title0" : MessageLookupByLibrary.simpleMessage("Todos"),
    "button_add_new_item" : MessageLookupByLibrary.simpleMessage("Add New Item"),
    "button_pick_date" : MessageLookupByLibrary.simpleMessage("Pick a date"),
    "button_update_item" : MessageLookupByLibrary.simpleMessage("Update Item"),
    "caption_delete" : MessageLookupByLibrary.simpleMessage("Delete"),
    "caption_edit" : MessageLookupByLibrary.simpleMessage("Edit"),
    "date_format" : MessageLookupByLibrary.simpleMessage("d-MM-yyyy"),
    "date_nothing_selected" : MessageLookupByLibrary.simpleMessage("Ничего не выбрано"),
    "model_status_completed" : MessageLookupByLibrary.simpleMessage("Completed"),
    "model_status_pending" : MessageLookupByLibrary.simpleMessage("Pending"),
    "snack_bar_text" : MessageLookupByLibrary.simpleMessage("Item deleted successfully"),
    "space" : MessageLookupByLibrary.simpleMessage(""),
    "text_field_text" : MessageLookupByLibrary.simpleMessage("Enter Title"),
    "text_field_title" : MessageLookupByLibrary.simpleMessage("Title"),
    "tool_tip" : MessageLookupByLibrary.simpleMessage("Добавить новую задачу")
  };
}
