import 'package:json_annotation/json_annotation.dart';

enum ScoringCondition {
@JsonValue('Food')Food,
@JsonValue('Living')Living,
@JsonValue('Utility')Utility,
@JsonValue('Outdoor')Outdoor,
@JsonValue('Sleeping')Sleeping,
@JsonValue('Corridor')Corridor,
@JsonValue('Downstairs')Downstairs,
@JsonValue('Special')Special,
@JsonValue('Mirror')Mirror,
@JsonValue('Painting')Painting,
@JsonValue('Swords')Swords,
@JsonValue('Torch')Torch,
@JsonValue('AllRooms')AllRooms,
@JsonValue('Any')Any,
@JsonValue('SleepingRoom')SleepingRoom,
@JsonValue('Always')Always,
@JsonValue('BonusCard')BonusCard,
@JsonValue('None')None,
@JsonValue('Activity')Activity,
@JsonValue('Secret')Secret,
}