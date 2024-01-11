// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String email;
  final String name;
  final List<String> followers;
  final List<String> following;
  final String profile;
  final String bannerPicture;
  final String uid;
  final String bio;
  final bool isBlueTick;
  UserModel({
    required this.email,
    required this.name,
    required this.followers,
    required this.following,
    required this.profile,
    required this.bannerPicture,
    required this.uid,
    required this.bio,
    required this.isBlueTick,
  });

  UserModel copyWith({
    String? email,
    String? name,
    List<String>? followers,
    List<String>? following,
    String? profile,
    String? bannerPicture,
    String? uid,
    String? bio,
    bool? isBlueTick,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      profile: profile ?? this.profile,
      bannerPicture: bannerPicture ?? this.bannerPicture,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      isBlueTick: isBlueTick ?? this.isBlueTick,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'followers': followers,
      'following': following,
      'profile': profile,
      'bannerPicture': bannerPicture,
      'uid': uid,
      'bio': bio,
      'isBlueTick': isBlueTick,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      name: map['name'] as String,
      followers: map['follwers'] as List<String>,
      following: map['following'] as List<String>,
      profile: map['profile'] as String,
      bannerPicture: map['bannerPicture'] as String,
      uid: map['uid'] as String,
      bio: map['bio'] as String,
      isBlueTick: map['isBlueTick'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, followers: $followers, following: $following, profile: $profile, bannerPicture: $bannerPicture, uid: $uid, bio: $bio, isBlueTick: $isBlueTick)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.name == name &&
        listEquals(other.followers, followers) &&
        listEquals(other.following, following) &&
        other.profile == profile &&
        other.bannerPicture == bannerPicture &&
        other.uid == uid &&
        other.bio == bio &&
        other.isBlueTick == isBlueTick;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        followers.hashCode ^
        following.hashCode ^
        profile.hashCode ^
        bannerPicture.hashCode ^
        uid.hashCode ^
        bio.hashCode ^
        isBlueTick.hashCode;
  }
}
