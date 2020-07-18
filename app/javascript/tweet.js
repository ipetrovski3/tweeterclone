document.addEventListener('turbolinks:load', () {

  getElementById('change').onclick = changeColor;

function changeColor() {
    document.body.style.color = "purple";
    return false;
}
