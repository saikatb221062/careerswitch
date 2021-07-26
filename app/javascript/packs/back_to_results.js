const backToResults = () => {
  // console.log('I am in backToResults.js');
  const backToResultsBtn = document.getElementById('back-to-results');

  if (!backToResultsBtn) {
    // console.log('This is not the right place - getting out !');
    return;
  };

  let currentURL = sessionStorage.getItem('currentURL');
  console.log(`currentURL = ${currentURL}`)
  const btnP1 = '<a href="'
  const btnP3 = '" class="btn btn-sm btn-dark rounded-pill" style="float: none; padding: 0.25rem 1.5rem;">Back to Results</a>'

  if (!currentURL) {
    currentURL = '/results?commit=Start+Connecting'
  }
  else 
  if (currentURL.includes("dashboard")) {
    currentURL = '/results?commit=Start+Connecting'
  };

  backToResultsBtn.innerHTML = `${btnP1}${currentURL}${btnP3}`

  const cNames = Array(12).fill("");
  const courseNames = document.querySelectorAll('.course');
  
  const coursesArray = makeCoursesArray(courseNames);

  let startMth = '';
  if (document.getElementById('rdmap-start')) {
    startMth = parseInt(document.getElementById('rdmap-start').innerText);
  }
  else {
    startMth = '';
  };

  const rdmapCNames = populateRdmapCourses(cNames, coursesArray, startMth);
  
  var rdmapCourse1 = document.getElementById('course-name-1');
  rdmapCourse1.innerText = rdmapCNames[0];
  var rdmapCourse2 = document.getElementById('course-name-2');
  rdmapCourse2.innerText = rdmapCNames[1];
  var rdmapCourse3 = document.getElementById('course-name-3');
  rdmapCourse3.innerText = rdmapCNames[2];
  var rdmapCourse4 = document.getElementById('course-name-4');
  rdmapCourse4.innerText = rdmapCNames[3];

  var rdmapCourse5 = document.getElementById('course-name-5');
  rdmapCourse5.innerText = rdmapCNames[4];
  var rdmapCourse6 = document.getElementById('course-name-6');
  rdmapCourse6.innerText = rdmapCNames[5];
  var rdmapCourse7 = document.getElementById('course-name-7');
  rdmapCourse7.innerText = rdmapCNames[6];
  var rdmapCourse8 = document.getElementById('course-name-8');
  rdmapCourse8.innerText = rdmapCNames[7];

  var rdmapCourse9 = document.getElementById('course-name-9');
  rdmapCourse9.innerText = rdmapCNames[8];
  var rdmapCourse10 = document.getElementById('course-name-10');
  rdmapCourse10.innerText = rdmapCNames[9];
  var rdmapCourse11 = document.getElementById('course-name-11');
  rdmapCourse11.innerText = rdmapCNames[10];
  var rdmapCourse12 = document.getElementById('course-name-12');
  rdmapCourse12.innerText = rdmapCNames[11];

  function makeCoursesArray(courseNames) 
  {
    const coursesArray = [];
    courseNames.forEach(element => coursesArray.push(element.innerText));
    return coursesArray;
  };

  function populateRdmapCourses(cNames, coursesArray, startMth) 
  {
    let j = 0;
    for (var i = startMth - 1; i < 12; i++)
    {
      if ( j > (coursesArray.length - 1)) 
      {
        break
      }
      if (startMth == 0) 
      {
        break
      }
      cNames[i] = coursesArray[j];
      j = j + 1; 
    };
    return cNames;
  }
}

export { backToResults }
