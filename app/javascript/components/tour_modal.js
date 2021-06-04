const showHideForms = (event) => {
  const forms = document.querySelectorAll(".multi-collapse");
  const button = event.currentTarget;

  const firstCollapseButton = document.querySelector(".collapse-button:first-of-type");
  firstCollapseButton.classList.remove('first');

  forms.forEach((form) => {
    if (form.id !== button.attributes.href) {
      form.classList.remove('show');
    }
  });
};

const activeStep = (event) => {
  const button = event.currentTarget;

  [...button.parentElement.children].forEach((child) => {
    child.classList.remove('active');
  });

  button.classList.add('active');
};

const addTourButtonsListener = () => {
  const buttons = document.querySelectorAll(".collapse-button");

  if (buttons) {
    buttons.forEach((button) => {
      button.addEventListener('click', showHideForms);
      button.addEventListener('click', activeStep);
    });
  }
};

const closeButtonHandler = (event) => {
  const firstCollapseButton = document.querySelector(".collapse-button:first-of-type");
  firstCollapseButton.classList.add('first');
  const removeMultiCollapse = document.getElementsByClassName("multi-collapse collapse show");
  removeMultiCollapse[0].classList.remove('show');
  const firstMultiCollapse = document.querySelector("#multiCollapseAddTour");
  firstMultiCollapse.classList.add('show');
};

const addTourButtonListener = () => {
  const addButton = document.querySelector(".add-tour");
  if (!addButton) return

  addButton.addEventListener('click', () => {
    const firstCollapseButton = document.querySelector(".collapse-button:first-of-type");
    firstCollapseButton.classList.add('first');
  });
};

const addTourCloseButtonListener = () => {
  const closeButton = document.querySelector("#close-add-tour");
  if (!closeButton) return

  closeButton.addEventListener('click', closeButtonHandler);
};

export { addTourButtonsListener, addTourButtonListener, addTourCloseButtonListener };

