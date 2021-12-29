import updateNavbar from './updateNavbar';

updateNavbar('#0a84d0', 'white');
$('.signup-form-area').css('border-radius', '0');
$('.layout-example').on('click', function() { selectLayoutToggle(this); });
$('.color-ball').on('click', function() { selectColorToggle(this); });

function selectLayoutToggle(layout) {
  if ($(layout).attr('selected') === undefined)
    selectLayout(layout);
  else
    deselectLayout(layout);
  nextStepButtonToggle();
}

function selectLayout(layout) {
  if ($('.layout-example[selected]').length > 0) return;

  $('input[name="layout"]').attr('value', $(layout).attr('value'));
  $(layout).css('border', '3px solid #0a84d0').css('width', '397px');
  $(layout).attr('selected', true);
}

function deselectLayout(layout = '.layout-example[selected]') {
  $(layout).css('border', 'none').css('width', '400px');
  $(layout).removeAttr('selected');
}

function nextStepButtonToggle() {
  if ($('.layout-example[selected]').length > 0 && $('.color-ball[selected]').length > 0)
    $('.next-step-button').prop('disabled', false);
  else
    $('.next-step-button').prop('disabled', true);
}

function selectColorToggle(color) {
  if ($(color).attr('selected') === undefined)
    selectColor(color);
  else
    deselectColor(color);
  nextStepButtonToggle();
}

function selectColor(color) {
  if ($('.color-ball[selected]').length > 0) return;

  $('input[name="color"]').attr('value', $(color).attr('value'));
  $(color).css('border', '2px solid #000000');
  $(color).attr('selected', true);
}

function deselectColor(color = '.color-ball[selected]') {
  $(color).css('border', 'none');
  $(color).removeAttr('selected');
}
