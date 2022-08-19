import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_upload_image.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {
  UploadImageBloc() : super(UploadImageInitial()) {
    on<UploadImage>((event, emit) async {
      try {
        emit(UploadImageLoading());
        uint8list = event.uint8list;
        fileName = event.fileName;
        emit(UploadImageSuccess(uint8list: uint8list, fileName: fileName));
      } catch (e) {
        emit(UploadImageFailure(error: e.toString()));
      }
    });
  }

  late Uint8List uint8list;
  late String fileName;
}
