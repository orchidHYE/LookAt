function UserPwd() {
  var lostname = document.getElementById("lostname");
  var losttel = document.getElementById("losttel");

  var errorname = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,11}$/;
  var errortel = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}/;

  var name = document.getElementById("name");
  var tel = document.getElementById("tel");

  var errorContainer = document.getElementById("errorContainer");
  errorContainer.innerHTML = "";

  if (!errorname.test(lostname.value)) {
    lostname.style.borderColor = "red";
    name.style.display = "block";
    lostname.focus();
    return false;
  } else {
    name.style.display = "none";
    lostname.style.borderColor = "";
  }

  if (!errortel.test(losttel.value)) {
    losttel.style.borderColor = "red";
    tel.style.display = "block";
    losttel.focus();
    return false;
  } else {
    tel.style.display = "none";
    losttel.style.borderColor = "";
  }

  return true;
}
