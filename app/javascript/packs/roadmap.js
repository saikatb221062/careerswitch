const roadMapBuild = () => {
    const addCourseBtn = document.querySelector("#add-course");
    const saveButton = document.querySelector("#click-save");

    addCourseBtn.addEventListener("click", (event) => {
      event.preventDefault();
      const courseProvider = button.data("course-provider");
      console.log(courseProvider);
      var courseTitle = button.data("course-title");
      console.log(courseTitle);
      var courseCost = button.data("course-cost");
      var courseId = button.data("course-id");

    const newCourseList = {
      courseId: document.querySelector("#click-modal").dataset.courseId,
      courseProvider: document.querySelector("#click-modal").dataset.courseProvider,
      courseTitle: document.querySelector("#click-modal").dataset.courseTitle,
      courseCost: document.querySelector("#click-modal").dataset.courseCost
    }

    saveToLocalStorage(newCourseList);

    const saveToLocalStorage = (newCourseList) => {
      if (window.localStorage.courseItems) {
        const courseArray = JSON.parse(window.localStorage.courseItems)
        courseArray.push(newCourseList);
        window.localStorage.courseItems = JSON.stringify(courseArray);
      } else {
        window.localStorage.courseItems = JSON.stringify([newCourseList]);
      }
      console.log(window.localStorage.courseItems);
    } 
  });
}


export { roadMapBuild };