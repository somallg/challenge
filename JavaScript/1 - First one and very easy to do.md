```
function usercheck() {
  input_user=document.formular.user.value;
  if (input_user=="warmup") {
    window.location.href=input_user +".php";
  }
  else {
    alert("Go home!");
    window.location.href="http://www.disney.com";
  }
}
```