export default function () {
    /**
     * Desktop menu accessibility and usability:
     * - Keyboard navigation (Tab, Shift+Tab, Escape)
     * - Focus trap within submenu
     */
    const items = document.querySelectorAll('.menu__item--has-submenu');

    items.forEach(item => {
        const submenu = item.querySelector('.submenu');
        const submenuContainer = item.querySelector('.submenu-container');
        const links = submenu ? submenu.querySelectorAll('a') : [];
        const parentLink = item.querySelector('a');
        const chevronBtn = item.querySelector('.submenu-chevron');
        let closeTimer = null;

        // Helper: open submenu (applies class to parent)
        function openSubMenu() {
            if (!item.classList.contains('submenu-is-active')) {
                item.classList.add('submenu-is-active');
                if (submenu) submenu.setAttribute('aria-hidden', 'false');
                if (chevronBtn) chevronBtn.setAttribute('aria-expanded', 'true');
            }
            if (closeTimer) {
                clearTimeout(closeTimer);
                closeTimer = null;
            }
        }
        // Helper: close submenu (removes class from parent)
        function closeSubMenu() {
            if (item.classList.contains('submenu-is-active')) {
                item.classList.remove('submenu-is-active');
                if (submenu) submenu.setAttribute('aria-hidden', 'true');
                if (chevronBtn) chevronBtn.setAttribute('aria-expanded', 'false');
            }
        }
        // Helper: trap focus within submenu
        function trapFocus(e) {
            if (!item.classList.contains('submenu-is-active')) return;
            if (links.length === 0) return;
            const first = links[0];
            const last = links[links.length - 1];
            if (e.key === 'Tab') {
                if (e.shiftKey && document.activeElement === first) {
                    e.preventDefault();
                    last.focus();
                } else if (!e.shiftKey && document.activeElement === last) {
                    e.preventDefault();
                    first.focus();
                }
            } else if (e.key === 'Escape') {
                closeSubMenu();
                parentLink.focus();
            }
        }
        // Mouse events: robust tracking
        function handleMouseEnter() {
            openSubMenu();
        }
        function handleMouseLeave() {
            closeTimer = setTimeout(() => {
                // Only close if mouse is not inside parent, submenu container, or submenu
                const isHovering = item.matches(':hover') ||
                    (submenuContainer && submenuContainer.matches(':hover')) ||
                    (submenu && submenu.matches(':hover'));
                if (!isHovering) {
                    closeSubMenu();
                }
            }, 100);
        }
        // Attach mouse events to parent <li> and submenu container
        item.addEventListener('mouseenter', handleMouseEnter);
        item.addEventListener('mouseleave', handleMouseLeave);
        if (submenuContainer) {
            submenuContainer.addEventListener('mouseenter', handleMouseEnter);
            submenuContainer.addEventListener('mouseleave', handleMouseLeave);
        }
        // Keyboard: open on focus, close on blur
        parentLink.addEventListener('focus', openSubMenu);
        parentLink.addEventListener('blur', () => {
            setTimeout(() => {
                if (!item.contains(document.activeElement)) {
                    closeSubMenu();
                }
            }, 10);
        });
        if (chevronBtn) {
            chevronBtn.addEventListener('focus', openSubMenu);
            chevronBtn.addEventListener('blur', () => {
                setTimeout(() => {
                    if (!item.contains(document.activeElement)) {
                        closeSubMenu();
                    }
                }, 10);
            });
            chevronBtn.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' || e.key === ' ') {
                    openSubMenu();
                    if (links.length) links[0].focus();
                }
                if (e.key === 'Escape') {
                    closeSubMenu();
                    chevronBtn.blur();
                    parentLink.focus();
                }
            });
        }
        // Submenu links: trap focus, close on Escape
        links.forEach(link => {
            link.addEventListener('keydown', trapFocus);
            link.addEventListener('blur', () => {
                setTimeout(() => {
                    if (!item.contains(document.activeElement)) {
                        closeSubMenu();
                    }
                }, 10);
            });
        });
        // Ensure Escape always closes submenu, even if focus is on submenu container or submenu itself
        if (submenu) {
            submenu.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') {
                    closeSubMenu();
                    parentLink.focus();
                    e.stopPropagation();
                }
            });
        }
    });
}
