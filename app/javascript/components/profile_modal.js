const profileModal = () => {
  // console.log('I am in profileModal.js')
  const profileButtons = document.querySelectorAll(".profileBtn")
  if (profileButtons.length == 0) {
    // console.log("This is not the right place - Exiting");
    return;
  };

  const currentUser = document.getElementById("current-user-email")
  const profiles = document.querySelectorAll('.result-card');
  const currentURL = window.location.href;
  sessionStorage.removeItem('currentURL');
  sessionStorage.setItem('currentURL', currentURL);

  if (!currentUser) { 
    profiles.forEach(blurProfiles);
  }

  profileButtons.forEach(item => {
    item.addEventListener('click', event => {
      // var matchedUserId = event.target.dataset.matchedUserId
      // var matchedUserIsConnection = (event.target.dataset.matchedUserIsConnection === "true")
      
      if (currentUser) {
        // store the current URL in sessionStorage. When this modal gets redirected to "See
        // Roadmap", the "Back to Results" button on that page will need the full value of 
        // Results URL - complete with the search params entered by the User on the home page. // So, we save the URL in sessionStorage, to be used for "Back to Results" to use. 

        const currentURL = window.location.href;
        sessionStorage.removeItem('currentURL');
        sessionStorage.setItem('currentURL', currentURL);
      }
    })
  })

  function blurProfiles(item, index) 
  {
    if (index > 2) {
      const profileImg = item.querySelector('.result-card img');
      profileImg.style.filter = 'blur(3px)'
      const cardName = item.querySelector('.card-name');
      cardName.classList.add('card-name-mask');
    };
  };
}

export { profileModal }
