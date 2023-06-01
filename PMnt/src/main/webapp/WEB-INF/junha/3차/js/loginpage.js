const wrapper = document.querySelector(".wrapper"),
    signHeader  = document.querySelector(".sign header"),
    loginHeader = document.querySelector(".login header");
    back=document.querySelector(".btn2")

signHeader.addEventListener("click", () => {
    wrapper.classList.add("active");
});
loginHeader.addEventListener("click", () => {
    wrapper.classList.remove("active");
});

back.addEventListener("click", () => {
    wrapper.classList.remove("active");
});