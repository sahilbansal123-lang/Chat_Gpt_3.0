import 'package:chatgpt_course/services/api_services.dart';
import 'package:flutter/material.dart';
import '../models/models_model.dart';

class ModelProvider with ChangeNotifier {

  String currentModel  = "text-davinci-003";
  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel (String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelsList = [];
  List<ModelsModel> get getModelList {
    return modelsList;
  }

  Future<List<ModelsModel>> getAllModels () async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }

}