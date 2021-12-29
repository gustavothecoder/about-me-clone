export default function updateNavbar(brandColor = 'white', signupColor = '#0a84d0') {
  $('.navbar-nav').detach();
  $('.navbar-brand').css('color', brandColor);
  $('.navbar-signup').css('background-color', signupColor);
}
