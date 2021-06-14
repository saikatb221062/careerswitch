const addCourseBtn = () => {
  const courseFetch = document.querySelector(".course-selected")
  function addCourse() {
  var box = document.createElement("div");
  box.setAttribute('class', 'itembox')
  var holder = document.createElement("p");
  holder.setAttribute('class', 'output');
  // You can set the inner text of the p tag without creating a text node.
  holder.innerText = "course"
  box.appendChild(holder);
  // Trades should be an element with and ID because you probably only ever want to insert into one place.
  var trades = document.getElementById("add");
  trades.appendChild(box);
  }
}

export { addCourseBtn }
