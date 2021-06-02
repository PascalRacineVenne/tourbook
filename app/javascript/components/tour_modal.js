const showHideForms = (event) => {
  const forms = document.querySelectorAll(".multi-collapse");
  const button = event.currentTarget;

  forms.forEach((form) => {
    if (form.id !== button.attributes.href) {
      form.classList.remove('show');
    }
  });
};

const buttonsListener = () => {
  const buttons = document.querySelectorAll(".collapse-button");

  if (buttons) {
    buttons.forEach((button) => {
      button.addEventListener('click', showHideForms);
    });
  }
};

export { buttonsListener };
