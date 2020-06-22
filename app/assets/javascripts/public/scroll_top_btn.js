$(document).ready(() => {
  //Get the button:
  let scrollTopBtn = document.getElementById("scroll-top-btn");

  // When the user scrolls down 20px from the top of the document, show the button
  window.onscroll = function() {showScrollBtn()};

  function showScrollBtn() {
    if (document.body.scrollTop > 700 || document.documentElement.scrollTop > 700) {
      scrollTopBtn.style.display = "block";
    } else {
      scrollTopBtn.style.display = "none";
    }
  }

  // When the user clicks on the button, scroll to the top of the document
  scrollTopBtn.addEventListener('click', scrollTop); 

  function scrollTop() {
    $('html, body').animate({ scrollTop: 0 }, 'slow');
  }
});