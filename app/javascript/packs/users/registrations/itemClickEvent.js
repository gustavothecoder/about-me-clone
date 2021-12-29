$(function () {
  $('li[item-to-select]').on('click', function() { selectToggle(this); });
  $('.selected-item').on('click', function() { 
    deselectElement(this); 
    submitButtonToggle();
  });
  
  function selectToggle(element, maxNumberOfBlankFields = 2) {
    if (userHasAlreadySelectedTheItems() && !thisElementIsAlreadySelected(element))
      return;
    else if (thisElementIsAlreadySelected(element))
      deselectElement(element);
    else
      selectElement(element);
    submitButtonToggle(maxNumberOfBlankFields);
  }
  
  function userHasAlreadySelectedTheItems() {
    return $('.selected-item:empty').length === 0;
  }
  
  function thisElementIsAlreadySelected(element) {
    return $(`.selected-item:contains(${$(element).text()})`).length === 1;
  }
  
  function deselectElement(element) {
    const selectedItem = $(element).text();
    if (selectedItem === '') return;
    $(`li[item-to-select]:contains(${selectedItem})`).css('color', '#0a84d0')
                                                     .css('background-color', 'white');
    $(`.selected-item:contains(${selectedItem})`).text('')
                                                 .val(0)
                                                 .css('background-color', 'white');
    removeItemToSend(selectedItem);
  }
  
  function selectElement(element) {
    const elementText = $(element).text();
    const elementValue = $(element).val();
    $(element).css('color', 'white').css('background-color', '#0a84d0');
    $('.selected-item:empty').first()
                             .text(elementText)
                             .val(elementValue)
                             .css('background-color', '#0a84d0');
    addItemToSend(elementText, elementValue);
  }

  function submitButtonToggle(maxNumberOfBlankFields = 2) {
    if ($('.selected-item:empty').length <= maxNumberOfBlankFields) 
      $('.next-step-button').prop('disabled', false);
    else
      $('.next-step-button').prop('disabled', true);
  }

  function addItemToSend(name, value) {
    const normalizedName = normalizeElementName(name);
    $('form').append(
      `<input type="hidden" id="${normalizedName}" name="items[]" value="${value}">`
    );
  }

  function removeItemToSend(name) {
    const normalizedName = normalizeElementName(name);
    $(`#${normalizedName}`).remove();
  }

  function normalizeElementName(name) {
    if (name.split(' ').length === 1) return name;

    return name.replace(/ /g, '_');
  }
});
