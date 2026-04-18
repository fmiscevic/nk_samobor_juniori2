document.addEventListener("DOMContentLoaded", function () {
    const sliders = document.querySelectorAll(".slider");

    sliders.forEach((slider) => {
        const track = slider.querySelector(".slider-track");
        const slides = slider.querySelectorAll(".slide");
        const prevBtn = slider.querySelector(".prev");
        const nextBtn = slider.querySelector(".next");

        if (!track || slides.length === 0) return;

        let index = 0;

        function updateSlider() {
            track.style.transform = `translateX(-${index * 100}%)`;
        }

        if (nextBtn) {
            nextBtn.addEventListener("click", () => {
                index = (index + 1) % slides.length;
                updateSlider();
            });
        }

        if (prevBtn) {
            prevBtn.addEventListener("click", () => {
                index = (index - 1 + slides.length) % slides.length;
                updateSlider();
            });
        }
    });
});