const showProfile = () => {
  // check that there is at least one profile button, if not, exit function
  const myButtons = document.querySelectorAll('.profileBtn')
  if (myButtons.length == 0) {
    return;
  };

  const profiles = document.querySelectorAll('.result-card')
  
  // check if we have a Current User; if not, blur profiles after 3rd card
  const currentUser = document.getElementById("current-user-email")
  if (!currentUser) { 
    profiles.forEach(blurProfiles);
  }

  $('.profileBtn').on('click', async(event) => {
    const matchedUser = $(event.currentTarget).data('matchedUserId');
    const matchedRoadmap = $(event.currentTarget).data('matchedRoadmap');
    
    if (!currentUser) {
       $("#modalOne").modal("show");
       return;
    } 
    
    const profileData = await getProfileData(matchedUser);
    // console.log(profileData);
    
    populateModal(profileData);
    setupSeeRoadmapLink(matchedRoadmap);

    $("#modalTwo").modal("show"); 
  });

  const getProfileData = async (matchedUser) => {
    return await fetch(`/results/${matchedUser}`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        const data1 = new Map(Object.entries(data));
        const data2 = data1.get("matched_user");
        const data3 = new Map(Object.entries(data2));
        
        const profile = 
        {
          id: data3.get("id"),
          email: data3.get("email"),
          created_at: data3.get("created_at"),
          name: `${data3.get("first_name")} ${data3.get("last_name")}`,
          budget: data3.get("budget"),
          timeframe: data3.get("timeframe"),
          current_role: data3.get("current_role"),
          current_industry: data3.get("current_industry"),
          future_role: data3.get("future_role"),
          future_industry: data3.get("future_industry"),
          available_hrs_per_week: data3.get("available_hrs_per_week"),
          status: data3.get("status"),
          location: data3.get("location"),
          motivation: data3.get("motivation"),
          satisfaction: data3.get("satisfaction"),
          journey_experience: data3.get("journey_experience"),
          advice: data3.get("advice"),
          img_url: data3.get("img_url") 
        };
      return profile;
    });
  };

  function blurProfiles(item, index) 
  {
    if (index > 2) {
      const profileImg = item.querySelector('.result-card img');
      profileImg.style.filter = 'blur(3px)'
      // profileImg.classList.add('img-mask');
      const cardName = item.querySelector('.card-name');
      cardName.classList.add('card-name-mask');
    };
  };

  function populateModal(profileData) {
    const mb2Name = document.getElementById('mb2-name');
    const mb2Status = document.getElementById('mb2-status');
    const mb2MbrSince = document.getElementById('mb2-mbrsince');
    const mb2Locn = document.getElementById('mb2-locn');
    
    const mb2CurrRole = document.getElementById('mb2-currentrole');
    
    // Current Role and Future Role are used as DOM elements twice in the page
    // mb2CRole and mb2FRole are used in the left sidebar of the modal
    // mb2CurrRole and mb2FutRole are used in the right section of the modal
    const mb2CRole = document.getElementById('mb2-currrole');
    const mb2FRole = document.getElementById('mb2-futrole');
    
    const mb2CurrInd = document.getElementById('mb2-currentind');
    // console.log(mb2CurrInd);
    const mb2FutRole = document.getElementById('mb2-futurerole');
    // console.log(mb2FutRole);
    const mb2FutInd = document.getElementById('mb2-futureind');
    // console.log(mb2FutInd);
    const mb2Bdgt = document.getElementById('mb2-budget');
    const mb2Timeframe = document.getElementById('mb2-timeframe');
    const mb2HrsWk = document.getElementById('mb2-hrsperwk');
    const mb2Motivation = document.getElementById('mb2-motivation');
    const mb2Satisfaction = document.getElementById('mb2-satisfaction');
    const mb2Journey = document.getElementById('mb2-journey');
    const mb2Advice = document.getElementById('mb2-advice');
    
    $("#mb2-imgurl").attr('src',`${profileData.img_url}`);
    mb2Name.innerText = profileData.name
    // if Status is empty or whitespace, set it to 'Offline'
    if (!profileData.status.trim()) {
      mb2Status.innerText = 'Offline';
    }
    else {
      mb2Status.innerText = profileData.status;
    };

    const jsDate = new Date(profileData.created_at);
    Date.prototype.getMonthText = function() 
    {
      var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      return months[this.getMonth()];
    }
    // console.log(`${jsDate.getDate()}, ${month}, ${jsDate.getFullYear()}`)
    var month = jsDate.getMonthText();
    mb2MbrSince.innerText = `${month}, ${jsDate.getFullYear()}`;
    mb2Locn.innerText = profileData.location;

    mb2CRole.innerText = profileData.current_role;
    
    var lastThree = profileData.future_role.slice(profileData.future_role.length - 3); 
        
    if (lastThree == "ing") {
      mb2FRole.innerText = profileData.future_role.slice(0, -3);
      mb2FutRole.innerText = profileData.future_role.slice(0, -3);
    }
    else {
      mb2FRole.innerText = profileData.future_role;
      mb2FutRole.innerText = profileData.future_role;
    };
    
    var vowels = ['a', 'e', 'i', 'o', 'u'];
    var firstChar = profileData.current_role.charAt(0).toLowerCase();
    if (vowels.includes(firstChar)) {
      mb2CurrRole.innerText = " an " + profileData.current_role;
    }
    else {
      mb2CurrRole.innerText = " a " + profileData.current_role;
    };

    mb2CurrInd.innerText = profileData.current_industry;
    
    mb2FutInd.innerText = profileData.future_industry;
    mb2Bdgt.innerText = profileData.budget;
    mb2Timeframe.innerText = profileData.timeframe;
    mb2HrsWk.innerText = profileData.available_hrs_per_week;
    mb2Motivation.innerText = profileData.motivation;
    mb2Satisfaction.innerText = profileData.satisfaction;
    mb2Journey.innerText = profileData.journey_experience;
    mb2Advice.innerText = profileData.advice;
  }

  function setupSeeRoadmapLink(matchedRoadmap) {
    // store the current URL in sessionStorage.  When this modal gets 
    // redirected to "See Roadmap", the link-back button on that page 
    // will need to reconstruct the My Results URL on the way back, so
    // it will use the URL saved in sessionStorage
    // console.log(`matchedRoadmap = ${matchedRoadmap}`)
    const currentURL = window.location.href;
    sessionStorage.removeItem('currentURL');
    sessionStorage.setItem('currentURL', currentURL);
    // use the matched Roadmap to create the href for "See Roadmap
    $('#mb2-seeRoadmap').attr('href',`/roadmaps/${matchedRoadmap}`);
    // const mb2seeRoadmap = document.getElementById('mb2-seeRoadmap');
    // console.log(mb2seeRoadmap);
  }
}

export { showProfile }
