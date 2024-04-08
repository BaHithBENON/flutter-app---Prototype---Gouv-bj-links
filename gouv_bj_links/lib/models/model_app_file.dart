import '../utilities/variables/models_attributs.dart';

class ModelAppFile {
  String? createdTimestamp;
  String? fileName;
  String? fileType;
  String? fileExtension;
  String? fileUrl;

  ModelAppFile(
      {this.createdTimestamp,
      this.fileExtension,
      this.fileName,
      this.fileType,
      this.fileUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ModelsAttributs.CREATED_TIMESTAMP: createdTimestamp,
      ModelsAttributs.FILE_EXTENSION: fileExtension,
      ModelsAttributs.FILE_NAME: fileName,
      ModelsAttributs.FILE_URL: fileUrl,
      ModelsAttributs.FILE_TYPE: fileType,
    };
  }

  factory ModelAppFile.toModelAppFile(dynamic data) {
    return ModelAppFile(
      createdTimestamp: data[ModelsAttributs.CREATED_TIMESTAMP],
      fileExtension: data[ModelsAttributs.FILE_EXTENSION],
      fileName: data[ModelsAttributs.FILE_NAME],
      fileType: data[ModelsAttributs.FILE_TYPE],
      fileUrl: data[ModelsAttributs.FILE_URL],
    );
  }
}