import updateNavbar from './updateNavbar';

updateNavbar();
$("#password").on("change", checkIfThePasswordsAreTheSame);
$("#password_confirmation").on("change", checkIfThePasswordsAreTheSame);


function checkIfThePasswordsAreTheSame() {
  if ($("#password").val() === $("#password_confirmation").val()) {
    $("#warning").css("color", "#FFFFFF");
    $(".next-step-button").prop("disabled", false);
  } else {
    $("#warning").css("color", "#D92626");
    $(".next-step-button").prop("disabled", true);
  }
}
