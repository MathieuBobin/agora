$(document).ready(() => {
  $('#validate_btn').click(() => {
    let url = "/cities/" + $('.my-city')[0].id;
    let category_ids = [];
      $.each($("#categories option:selected"), function() {            
          category_ids.push($(this).val());
      });
    let additional_filter = $('#more_filters option:selected').val();
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'html',
      data: { category_ids: category_ids, additional_filter: additional_filter },
      success: (result) => {
        console.log(result);
        // $('#items_container').remove(); 
        // let items_container = $(result).filter('#items_container')[0];
        // $('#category_selector').after(items_container);
      },
      error: (error) => {
        console.log(error);
      }
    });
  })
})