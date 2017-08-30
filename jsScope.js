// function rando() {
//   let boo = 5;
//
//   function inside() {
//     boo++;
//     console.log(boo);
//   }
//   inside()
//   console.log(boo);
// }
// rando();

let text = 'outside';
function logIt(){
  const text;
  console.log(text);
  text = 'boo';
};
// console.log(text);
logIt();
