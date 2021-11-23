// import 'package:parse_functions/parse_functions.dart';

// class SelectedTokenData {
//   SelectedTokenData({
//     this.mainBalance,
//     this.delegatedBalance,
//     this.originatedAddresses,
//     this.adding,
//     this.stake,
//     this.rewards,
//     this.frozenBalance,
//     this.unstake,
//   });

//   final double mainBalance;
//   final double delegatedBalance;
//   final List<dynamic> originatedAddresses;
//   final List<Adding> adding;
//   final double stake;
//   final double rewards;
//   final double frozenBalance;
//   final double unstake;

//   factory SelectedTokenData.fromJson(
//           Map<String, dynamic> json, List<Map<String, dynamic>> adding) =>
//       SelectedTokenData(
//         mainBalance: parseDouble(json['mainBalance'], 0),
//         delegatedBalance: parseDouble(json['delegatedBalance'], 0),
//         originatedAddresses: (json['originatedAddresses'] as List<dynamic>)
//             .map((x) => x)
//             .toList(),
//         adding: adding.map((x) => Adding.fromJson(x)).toList(),
//         stake: parseDouble(json['stake'], 0),
//         rewards: parseDouble(json['rewards'], 0),
//         frozenBalance: parseDouble(json['frozenBalance'], 0),
//         unstake: parseDouble(json['unstake'], 0),
//       );

//   Map<String, dynamic> toJson() => {
//         'mainBalance': mainBalance,
//         'delegatedBalance': delegatedBalance,
//         'originatedAddresses':
//             List<dynamic>.from(originatedAddresses.map((x) => x)),
//         'adding': List<dynamic>.from(adding.map((x) => x.toJson())),
//         'stake': stake,
//         'rewards': rewards,
//         'frozenBalance': frozenBalance,
//         'unstake': unstake,
//       };
// }

// class Adding {
//   Adding({
//     this.name,
//     this.current,
//     this.limit,
//     this.used,
//   });

//   final String name;
//   final double current;
//   final double limit;
//   final double used;

//   factory Adding.fromJson(Map<String, dynamic> json) => Adding(
//         name: json['name'] as String,
//         current: parseDouble(json['current'], 0),
//         limit: parseDouble(json['limit'], 0),
//         used: parseDouble(json['used'], 0),
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'current': current,
//         'limit': limit,
//         'used': used,
//       };
// }
