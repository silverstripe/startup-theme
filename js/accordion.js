export default function() {
    /**
     * Accordions
     *
     * Looks for elements with the data attribute `data-accordion-link`
     * and toggles the display of the accordion item contents when clicked.
     *
     * Currently used on the mobile sub menus but designed for multi-use.
     */
    const accordions = document.querySelectorAll('[data-accordion-link]')

    if (accordions.length) {
        accordions.forEach(function(accordion) {
            accordion.addEventListener('click', toggleAccordion)
        })
    }

    function toggleAccordion(el) {
        const link = el.target.closest('[data-accordion-link]')
        const currentItem = link.closest('[data-accordion-item]')
        const parent = link.closest('[data-accordion]')
        const allItems = parent.querySelectorAll('[data-accordion-item]')

        /**
         * Adds the class `is-active` to the `data-accordion-item` element
         * so that we can style the accordion states.
         */
        link.setAttribute('aria-expanded', link.getAttribute('aria-expanded') !== 'true')
        currentItem.classList.toggle('is-active')

        /**
         * Only allow for one accordion item to be open at a time
         */
        if (allItems.length) {
            allItems.forEach(function(item) {
                if (item !== currentItem) {
                    item.classList.remove('is-active');
                    item.querySelector('[data-accordion-link]').setAttribute('aria-expanded', 'false')
                }
            })
        }
    }
}
