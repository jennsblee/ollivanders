import swal from 'sweetalert';


const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};
// const initSweetalert = (selector) => {
//   const swalButton = document.querySelector(selector);
//   if (swalButton) { // protect other pages
//     swalButton.addEventListener('click', () => {
//       swal({}) // <-- add the `.then(callback)`
//     });
//   }
// };

export { initSweetalert };


// title: "A nice alert",
//         text: "This is a great alert, isn't it?",
//         icon: "success",
//         timer: 3000
