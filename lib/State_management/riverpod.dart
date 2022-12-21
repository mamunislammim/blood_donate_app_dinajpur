

import 'package:dinajpur_blood_app/Repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var donorDataRiverpod = FutureProvider((ref) => Repo().getDonorDetails());
var postRiverpod = FutureProvider((ref) => Repo().getPostRepo());