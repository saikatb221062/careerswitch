const backToResults = () => {
  const backToResultsBtn = document.getElementById('back-to-results');

  if (backToResultsBtn) {
    const queryString = location.search.substring(1);
    const newString = queryString.replace(/%20/g, "+");
    const tmpArray = newString.split("|")
    const btnP2 = tmpArray[0];
    const btnP4 = tmpArray[1];
    // console.log(`${btnP2} ${btnP4}`)

    const backToResultsBtn = document.getElementById('back-to-results');
    // console.log(backToResultsBtn.innerHTML);

    const btnP1 = '<a href="/results?query_from='
    const btnP3 = '&query_to='
    const btnP5 = '&commit=Search" class="btn btn-outline-success rounded-pill"   style="float: left;">Back to Results</a>'

    backToResultsBtn.innerHTML = `${btnP1}${btnP2}${btnP3}${btnP4}${btnP5}`
  }
}

export { backToResults }
