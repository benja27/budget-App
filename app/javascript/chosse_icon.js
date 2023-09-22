
  var iconPickerIcons = document.querySelectorAll('#icon-picker i');
  var selectedIconInput = document.getElementById('selected_icon');

  iconPickerIcons.forEach(function(icon) {
    icon.addEventListener('click', function() {
      var selectedIcon = this.getAttribute('data-icon');
      selectedIconInput.value = selectedIcon;

      iconPickerIcons.forEach(function(icon) {
        icon.classList.remove('selected');
      });

      this.classList.add('selected');
    });
  });


