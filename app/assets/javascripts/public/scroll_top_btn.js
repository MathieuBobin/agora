$(document).ready(() => {
  //Get the button:
  let scrollTopBtn = document.getElementById("scroll-top-btn");

  console.log(scrollTopBtn);

  // When the user scrolls down 20px from the top of the document, show the button
  window.onscroll = function() {scrollFunction()};

  function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      scrollTopBtn.style.display = "block";
    } else {
      scrollTopBtn.style.display = "none";
    }
  }

  // When the user clicks on the button, scroll to the top of the document
  scrollTopBtn.addEventListener('click', topFunction); 

  function topFunction() {
    $('html, body').animate({ scrollTop: 0 }, 'slow');
  }
});