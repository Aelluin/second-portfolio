import "./bootstrap";
document.addEventListener("mousemove", function (event) {
    const img = document.querySelector(".img-fluid");
    const rect = img.getBoundingClientRect();

    const centerX = rect.left + rect.width / 2;
    const centerY = rect.top + rect.height / 2;

    const mouseX = event.clientX;
    const mouseY = event.clientY;

    const deltaX = mouseX - centerX;
    const deltaY = mouseY - centerY;

    const angleX = (deltaY / rect.height) * 20; // Adjust sensitivity
    const angleY = (deltaX / rect.width) * -20; // Adjust sensitivity

    img.style.transform = `rotateX(${angleX}deg) rotateY(${angleY}deg)`;
});
