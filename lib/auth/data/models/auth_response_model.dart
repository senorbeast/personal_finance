import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'auth_response_model.g.dart';

@Entity()
@JsonSerializable()
class AuthResponseModel {
  @Id(assignable: true)
  int? id;

  @JsonKey(name: 'username')
  final String username;

  @JsonKey(name: 'email')
  final String email;

  // Add other necessary fields

  AuthResponseModel({
    required this.username,
    required this.email,
    // Add other necessary fields
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}
