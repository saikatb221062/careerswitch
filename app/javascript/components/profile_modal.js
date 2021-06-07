const profileModal = () => {
  const modal = document.querySelector("#resultsModal");
  
  if (modal) {
    const currentUserEmail = document.getElementById("current-user-email");
    if (currentUserEmail) {
    }
    else {
      const profiles = document.querySelectorAll('.profiles');
      profiles.forEach(blurProfiles);
    }
    
    $('#resultsModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget) // Button that triggered the modal
      var matchedUserId = button.data('matched-user-id')
      var matchedFirstNm = button.data('matched-first-name')
      var matchedLastNm = button.data('matched-last-name')
      
      var matchedCurrentRole = button.data('matched-current-role')
      var matchedCurrentInd = button.data('matched-current-ind')
      var matchedFutInd = button.data('matched-fut-ind')
      var matchedImg = button.data('matched-img')

      var modal = $(this)
      
    })
  }
}

function blurProfiles(item, index) {
  const profileBtn = item.querySelector(".profile-btn")
  const matchedImgDiv = item.querySelector(".matched-img-div")
  const firstName = item.querySelector(".first-name")
  const lastName = item.querySelector(".last-name")
  const currentRole = item.querySelector(".current-role")
  const currentInd = item.querySelector(".current-ind")
  const futureInd = item.querySelector(".future-ind")
  
  if (index > 2) {
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
    matchedImgDiv.insertAdjacentHTML('beforeend', '<img class="matched-user-image img-fluid" style="vertical-align:middle; width:70px; height: 70px; border-radius: 50%;" src="https://images.pexels.com/photos/4103409/pexels-photo-4103409.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=1260" alt="">');
    firstName.classList.add("text-muted")
    lastName.classList.add("text-muted")
    currentRole.classList.add("text-muted")
    currentInd.classList.add("text-muted")
    futureInd.classList.add("text-muted")

    profileBtn.classList.remove("btn-success")
    profileBtn.classList.add("btn-secondary")
    profileBtn.classList.add("text-muted")
  }
  else {
    item.classList.remove("bg-secondary")
    profileBtn.classList.remove("btn-secondary")
    profileBtn.classList.remove("text-muted")
    profileBtn.classList.add("btn-success")
  } 
}

export { profileModal }