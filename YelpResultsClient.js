//
//
//
//Thomas Eads 6/25/2020 

//script to work with AJAX to process data pull (making a request) 

function showLodge(str) {
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  } else {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("txtHint").innerHTML = this.prettyJSon;
	console.log(this.prettyJson);
      }

    };
    xmlhttp.open("GET", "https://api.yelp.com/v3/businesses/matches/best");
    xmlhttp.send();
  } 
}


function postUser(str) {
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  } else {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("txtHint").innerHTML = this.prettyJson;
	console.log(this.prettyJson);
      }

    };
var data = {
	rating:double
}
 xmlhttp.open("POST","http://thomas:8080/lodgeResults");
    xmlhttp.send(data);
  }
}



























//This is to work with dynamic input on client side
/*
function insertUserData(str) {
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  } else {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("txtHint").innerHTML = this.responseText;
	console.log(this.responseText);
      }

    };


   var data = {
	fname: str
   }

    xmlhttp.open("POST","http://thomas:8080/insertData");
    xmlhttp.send(data);
  }
}

*/


































 /*  var data = {
	fname:str
   }
*/
/*
//This is to work with dynamic input on client side

function insertUserData(str) {
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  } else {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("txtHint").innerHTML = this.prettyJson;
	console.log(this.prettyJson);
      }

    };


 var data = {
	fname: str
   }

    xmlhttp.open("POST","http://thomas:8080/insertData");
    xmlhttp.send(data);
  }
}


*/








//open dropdown menu when you click on the button
/*function dropdownClick() {
  document.getElementById("myDropdown").classList.toggle("show");
  }
*/


// Close dropdown on click away

/*

//Log the given input in each field to the console on each keystroke for testing purposes

document.getElementById('fname').addEventListener('input', function() {
    console.log(this.value);
});
document.getElementById('lname').addEventListener('input', function() {
    console.log(this.value);
});
document.getElementById('maddress').addEventListener('input', function() {
    console.log(this.value);
});
document.getElementById('baddress').addEventListener('input', function() {
    console.log(this.value);
});
document.getElementById('ccnum').addEventListener('input', function() {
    console.log(this.value);
});
document.getElementById('ccv').addEventListener('input', function() {
    console.log(this.value);
});

*/


