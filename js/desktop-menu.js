export default function () {
    /**
     * Toggles display of desktop menu when hovering over menu items.
     *
     * Finds all menu items with submenus and adds appropriate event listeners.
     */
    const items = document.querySelectorAll('.menu__item--has-submenu');

    if (items.length) {
        items.forEach(function (item) {
          item.addEventListener('mouseover', () => toggleDesktopMenu(item));
          item.addEventListener('mouseout', () => toggleDesktopMenu(item));
        });
    }

    function toggleDesktopMenu(item) {
      item.classList.toggle('submenu-is-active');
    }
}
