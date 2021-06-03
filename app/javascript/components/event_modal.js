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

const editEventCloseButtonHandler = (event) => {
  const firstCollapseButton = document.querySelector(".collapse-button:first-of-type");
  firstCollapseButton.classList.add('first');
  const removeMultiCollapse = document.getElementsByClassName("multi-collapse collapse show");
  removeMultiCollapse[0].classList.remove('show');
  const firstMultiCollapse = document.querySelector("#multiCollapseAddTour");
  firstMultiCollapse.classList.add('show');
};

const editEventButtonsListener = () => {
  const buttons = document.querySelectorAll(".collapse-button");

  if (buttons) {
    buttons.forEach((button) => {
      button.addEventListener('click', showHideForms);
    });
  }
};

const editEventButtonListener = () => {
  const addButton = document.querySelector(".edit-event");
  if (!addButton) return

  addButton.addEventListener('click', () => {
    const firstCollapseButton = document.querySelector(".collapse-button:first-of-type");
    firstCollapseButton.classList.add('first');
  });
};

const editEventCloseButtonListener = () => {
  const closeButton = document.querySelector("#close-edit-event");
  if (!closeButton) return

  closeButton.addEventListener('click', closeButtonHandler);
};

export { editEventButtonsListener, editEventButtonListener, editEventCloseButtonListener };
