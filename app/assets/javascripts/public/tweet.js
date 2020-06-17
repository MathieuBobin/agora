$(document).ready(() => {
  let tweetBtn = $('#tweet-btn');
  tweetBtn.click(() => {
    let MyProposalId = $('.my-proposal')[0].id;
    let url = '/proposals/' + MyProposalId; 
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'html',
      data: { tweet: 'tweet' },
      success: () => {
        console.log('Success');
      },
      error: (error) => {
        console.log(error);
      }
    });
  })
})