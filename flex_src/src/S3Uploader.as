import com.elctech.S3UploadOptions;

import flash.external.ExternalInterface;

import mx.controls.DataGrid;
import mx.controls.ProgressBar;
import mx.controls.Button;
import mx.controls.Label;

import org.prx.uploader.MultipleFileS3Uploader;

private var _multipleFileUploader:MultipleFileS3Uploader;

private function registerCallbacks():void {
    if (ExternalInterface.available) {
      ExternalInterface.addCallback("init", init);
      ExternalInterface.call('s3_swf.init');
    }
}

private function init(signatureUrl:String, initialMessage:String="mxml", prefixPath:String="s3_swf_upload"):void {

    _multipleFileUploader = new MultipleFileS3Uploader(signatureUrl,
                                                       prefixPath,
                                                       userMessage,
                                                       browseButton,
                                                       uploadButton,
                                                       removeSelectedButton,
                                                       removeAllButton,
                                                       uploadProgressBar,
                                                       filesDataGrid);
}