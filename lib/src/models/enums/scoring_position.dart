import 'package:json_annotation/json_annotation.dart';

enum ScoringPosition {
@JsonValue('NW') NW,
@JsonValue('N') N,
@JsonValue('NE')NE,
@JsonValue('E')E,
@JsonValue('EE')EE,
@JsonValue('SE')SE,
@JsonValue('S')S,
@JsonValue('SS')SS,
@JsonValue('SW')SW,
@JsonValue('W')W,
@JsonValue('Connected')Connected,
@JsonValue('Type')Type,
@JsonValue('Above')Above,
@JsonValue('Below')Below,
@JsonValue('Neighbor')Neighbor,
}