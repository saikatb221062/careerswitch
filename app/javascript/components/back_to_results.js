const backToResults = () => {
  const backToResultsBtn = document.getElementById('back-to-results');

  if (backToResultsBtn) {
    const backToResultsBtn = document.getElementById('back-to-results');
    console.log(backToResultsBtn.innerHTML);
    const currentURL = sessionStorage.getItem('currentURL');
    console.log(currentURL);
    
    const btnP1 = '<a href="'
    const btnP3 = '" class="btn btn-outline-success rounded-pill"   style="float: left;">Back to Results</a>'

    backToResultsBtn.innerHTML = `${btnP1}${currentURL}${btnP3}`
  }
}

export { backToResults }
