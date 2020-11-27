import swal from 'sweetalert';



const initSweetalert = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

export { initSweetalert };



// const initSweetalert = (selector, options = {}) => {
//   const swalButton = document.querySelector(selector);
//   if (swalButton) { // protect other pages
//     swalButton.addEventListener('click', () => {
//       swal(options);
//     });
//   }
// };



// title: "A nice alert",
//         text: "This is a great alert, isn't it?",
//         icon: "success",
//         timer: 3000
