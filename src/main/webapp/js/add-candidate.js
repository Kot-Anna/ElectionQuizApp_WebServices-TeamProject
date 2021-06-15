const uploadimage = document.getElementById("img-file");
const outputimg = document.querySelector(".output-img");

uploadimage.addEventListener("change", () => {
  const file = uploadimage.files[0];

  if (file) {
    const reader = new FileReader();

    reader.addEventListener("load", function () {
      outputimg.setAttribute("src", this.result);
    });

    reader.readAsDataURL(file);
  }
});
