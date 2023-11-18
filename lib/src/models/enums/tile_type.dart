import 'package:json_annotation/json_annotation.dart';

enum TileType {
@JsonValue('Corridor') Corridor,
@JsonValue('Downstairs') Downstairs,
@JsonValue('Food') Food,
@JsonValue('Living') Living,
@JsonValue('Outdoor') Outdoor,
@JsonValue('Sleeping') Sleeping,
@JsonValue('Special') Special,
@JsonValue('ThroneRoom') ThroneRoom,
@JsonValue('Utility') Utility,
@JsonValue('Empty') Empty,
@JsonValue('Placeholder') Placeholder,
@JsonValue('RoyalAttendant') RoyalAttendant,
@JsonValue('BonusCard') BonusCard,
@JsonValue('Activity') Activity,
@JsonValue('Secret') Secret,
}