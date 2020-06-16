$(document).ready(() => {
  $('#validate_btn').click(() => {
    let url = "/cities/" + $('.my-city')[0].id;
    let categoryIds = [];
      $.each($("#categories option:selected"), function() {            
        categoryIds.push($(this).val());
      });
    let additionalFilter = $('#more_filters option:selected').val();
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'html',
      data: { category_ids: categoryIds, additional_filter: additionalFilter },
      success: (result) => {
        $('.my-city').remove();        
        let myCity = $(result).filter('.my-city')[0];
        $('#filter').after(myCity);
        $('.no-proposal').remove();        
      },
      error: (error) => {
        console.log(error);
      }
    });
  })
})