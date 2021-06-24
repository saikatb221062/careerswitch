const backToResults = () => {
  const backToResultsBtn = document.getElementById('back-to-results');

  if (backToResultsBtn) {
    const backToResultsBtn = document.getElementById('back-to-results');
    const currentURL = sessionStorage.getItem('currentURL');
    
    const btnP1 = '<a href="'
    const btnP3 = '" class="btn btn-outline-success rounded-pill" style="float: left;">Back to Results</a>'

    backToResultsBtn.innerHTML = `${btnP1}${currentURL}${btnP3}`
  }
}

export { backToResults }
