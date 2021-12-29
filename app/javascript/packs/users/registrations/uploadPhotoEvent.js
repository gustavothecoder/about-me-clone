$(function() {
  $('#add-photo-button').on('click', triggerPhotoClick);
  $('#change-photo-button').on('click', triggerPhotoClick);
  $('#photo').on('change', function () { showUploadedPhoto(this) });

  function triggerPhotoClick() { $('#photo').trigger('click'); }

  function showUploadedPhoto(input) {
    $('#default-picture').detach();
    if (input.files && input.files[0]) {
      let reader = new FileReader();
      reader.onload = function (e) {
        $(document.getElementById('preview-picture')).attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
    changeTheButtonsDisplayed();
  }

  function changeTheButtonsDisplayed() {
    $('#add-photo-button').detach();
    $('#change-photo-button').show();
    $('#confirm-photo').show();
  }
});
