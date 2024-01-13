import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/image_model.dart';

part 'gallery_event.dart';

class ImageFileBloc extends Bloc<GalleryImageCapture,List<ImageModel>>{
  ImageFileBloc():super([]){
    on<GalleryImageCapture>((event, emit) async{
      emit(state+[event]);
      SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
      sharedPreferences.setStringList("images", state.map((e) => e.imagePath).toList());
    },
    );
  }
}