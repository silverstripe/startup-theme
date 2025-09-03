export default function () {
    /**
     * Toggles display of desktop menu when hovering over menu items.
     *
     * Finds all menu items with submenus and adds appropriate event listeners.
     */
    const items = document.querySelectorAll('.menu__item--has-submenu');

    if (items.length) {
        items.forEach(function (item) {
          item.addEventListener('mouseover', () => toggleSubMenu(item));
          item.addEventListener('mouseout', () => toggleSubMenu(item));

          // Show submenu on focus
          let link = item.querySelector('a');
          link.addEventListener('focus', () => toggleSubMenu(item));

          // When last <a> tag loses focus, hide submenu
          let links = item.querySelectorAll('a');
          let finalLink = [...links].pop();
          finalLink.addEventListener('focusout', () => toggleSubMenu(item));
        });
    }

    function toggleSubMenu(item) {
      item.classList.toggle('submenu-is-active');
    }
}
