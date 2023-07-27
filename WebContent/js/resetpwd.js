 $(document).ready(function(){
  var setpw = document.getElementById("setpw");
  var setrepw = document.getElementById("setrepw");
  var settel = document.getElementById("settel");
  
  var pw = document.getElementById("pw");
  var repw = document.getElementById("repw");
  var tel = document.getElementById("tel");

  var errorpw = /^(?=.*\d)(?=.*[a-z]).{8,15}$/;


  var errorContainer = document.getElementById("errorContainer");
  errorContainer.innerHTML = "";

  //pw null or 유효성에 안 맞는 경우
  setpw.addEventListener("change", function() {
	  if (setpw.value === "") {
		  setpw.style.borderColor = "red";
			pw.style.display = "block";
			setpw.focus();
		} else if (!errorpw.test(setpw.value)) {
			setpw.style.borderColor = "red";
			pw.style.display = "block";
			setpw.focus();
		}else {
			pw.style.display = "none";
			setpw.style.borderColor = "";
		}
		return false;
	  });
  //pw null or 비번 확인이랑 다른 경우
  setrepw.addEventListener("change", function() {
	    if (setrepw.value === "") {
	    	setrepw.style.borderColor = "red";
	        repw.style.display = "block";
	        setrepw.focus();
	    } else if (setrepw.value !== setpw.value) {
	    	setrepw.style.borderColor = "red";
	        repw.style.display = "block";
	        setrepw.focus();
	    } else {
	        repw.style.display = "none";
	        setrepw.style.borderColor = "";
	    }
	    return false;
	});

  //input이 다 채워지면 버튼 활성화
  $("form[name='setPwd.jsp']").on('input', function() {
	  var allFilled = true;

	  $("input.text").each(function() {
	    if ($(this).val() === '') {
	      allFilled = false;
	      return false; // Exit the loop early if any input is empty
	    }
	  });

	  if (allFilled) {
	    // 모든 input이 채워져 있을 때
	    var setpw = document.getElementById("setpw");
	    var setrepw = document.getElementById("setrepw");
	    var settel = document.getElementById("settel");

	    if (
	      !errorpw.test(setpw.value) ||
	      setrepw.value !== setpw.value 
	    ) {
	      // 조건에 맞지 않으면 버튼 비활성화
	      $(".setpwd input").prop("disabled", true);
	    } else {
	      // 조건에 모두 맞으면 버튼 활성화
	      $(".setpwd input").prop("disabled", false);
	    }
	  } else {
	    // input이 하나라도 비어있을 때
	    $(".setpwd input").prop("disabled", true);
	  }
	  
	});
  
});
 
