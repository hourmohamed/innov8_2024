document.getElementById('profilePicture').addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const preview = document.getElementById('profilePicturePreview');
            preview.src = e.target.result;
        }
        reader.readAsDataURL(file);
    }
});