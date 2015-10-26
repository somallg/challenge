```
  function password () {
    var d1, d2, d3, d4, d5, input;
    d1=window.document.bgColor;
    d2=window.document.linkColor;
    d3=d1.substring (1,5)+d2.substring (1,3);
    d4=d3.toUpperCase ();
    input=prompt("Password:","");
    if (input!=d3 && input!=d4) {
      alert("Are you crazy? Thats so easy!");
      window.location.href="/hackchallenge.php";
    }
    else {
      window.location.href=d3+".php";
    }
  }
```
d1 = #D0D0D0
d2 = #FF9900
d3 = D0D0FF

