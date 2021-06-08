const profileModal = () => {
  const myButtons = document.querySelectorAll(".myBtn")
  const currentUser = document.getElementById("current-user-email")
  const profiles = document.querySelectorAll('.profiles');

  if (!currentUser) { 
    // console.log ("No Current User")
    profiles.forEach(blurProfiles);
  }

  myButtons.forEach(item => {
    item.addEventListener('click', event => {
      // console.log(event.target.dataset.matchedFirstNm)
      // console.log(event.target.dataset)
      var matchedAdvice = event.target.dataset.matchedAdvice
      var matchedBudget = event.target.dataset.matchedBudget
      var matchedCurrentInd = event.target.dataset.matchedCurrentInd
      var matchedCurrentRole = event.target.dataset.matchedCurrentRole
      var matchedExperience = event.target.dataset.matchedExperience
      var matchedFirstNm = event.target.dataset.matchedFirstNm
      var matchedHrs = event.target.dataset.matchedHrs
      var matchedFutInd = event.target.dataset.matchedFutInd
      var matchedImgURL = event.target.dataset.matchedImg
      var matchedLastNm = event.target.dataset.matchedLastNm
      var matchedLocation = event.target.dataset.matchedLocation
      var matchedMotivation = event.target.dataset.matchedMotivation
      var matchedSatisfaction = event.target.dataset.matchedSatisfaction
      var matchedTimeframe = event.target.dataset.matchedTimeframe
      // var matchedUserId = event.target.dataset.matchedUserId
      
      if (currentUser) {
        const mb2_1 = document.getElementById('mb2-1')
        const mb2_2 = document.getElementById('mb2-2')
        const mb2_3 = document.getElementById('mb2-3')
        const mb2_4 = document.getElementById('mb2-4')
        const mb2_5 = document.getElementById('mb2-5')
        const mb2_6 = document.getElementById('mb2-6')
        const mb2_7 = document.getElementById('mb2-7')
        const mb2_8 = document.getElementById('mb2-8')
        const mb2_9 = document.getElementById('mb2-9')
        const mb2_10 = document.getElementById('mb2-10')
        const mb2_11 = document.getElementById('mb2-11')
        const mb2_12 = document.getElementById('mb2-12')
        const mb2_13 = document.getElementById('mb2-13')
        const mb2_14 = document.querySelector('.mb2-14')

        mb2_1.innerText = matchedFirstNm
        mb2_2.innerText = matchedLastNm
        mb2_3.innerText = matchedLocation
        mb2_4.innerText = matchedCurrentRole
        mb2_5.innerText = matchedCurrentInd
        mb2_6.innerText = matchedFutInd
        mb2_7.innerText = `${matchedTimeframe} weeks`
        mb2_8.innerText = matchedBudget
        mb2_9.innerText = matchedHrs
        mb2_10.innerText = matchedExperience
        mb2_11.innerText = matchedSatisfaction
        mb2_12.innerText = matchedAdvice
        mb2_13.innerText = matchedMotivation
        
        const img_1 = '<img class="img-fluid" style="vertical-align:middle; width:80px; height: 80px; border-radius: 50%;" src="'
        const img_3 = '" alt="">'

        mb2_14.innerHTML = `${img_1}${matchedImgURL}${img_3}`

        $("#modalTwo").modal("show");   
      }
      else {
        $("#modalOne").modal("show");
      }
    })
  })

  function blurProfiles(item, index) 
  {
    const profileBtn = item.querySelector(".myBtn")
    const matchedImgDiv = item.querySelector(".matched-img-div")
    const firstName = item.querySelector(".first-name")
    const lastName = item.querySelector(".last-name")
    const currentRole = item.querySelector(".current-role")
    const currentInd = item.querySelector(".current-ind")
    const futureInd = item.querySelector(".future-ind")
  
    if (index > 2) 
    {
      item.classList.add("bg-secondary")
      firstName.innerText = "****"
      lastName.innerText = "****"
      currentRole.innerText = "----"
      currentInd.innerText = "----"
      futureInd.innerText = "----"
      firstName.classList.remove("bold")
      lastName.classList.remove("bold")
      currentRole.classList.remove("bold")
      currentInd.classList.remove("bold")
      futureInd.classList.remove("bold")
      matchedImgDiv.innerHTML=""
      matchedImgDiv.insertAdjacentHTML('beforeend', '<i class="display-4 fas fa-user-alt"></i>')
   
      firstName.classList.add("text-muted")
      lastName.classList.add("text-muted")
      currentRole.classList.add("text-muted")
      currentInd.classList.add("text-muted")
      futureInd.classList.add("text-muted")

      profileBtn.classList.remove("btn-success")
      profileBtn.classList.add("btn-secondary")
      profileBtn.classList.add("text-muted")
    }
    else 
    {
      item.classList.remove("bg-secondary")
      profileBtn.classList.remove("btn-secondary")
      profileBtn.classList.remove("text-muted")
      profileBtn.classList.add("btn-success")
    } 
  }

}

export { profileModal }
