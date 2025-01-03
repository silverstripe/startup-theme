<header class="header">
    <a href="#main" class="button button--on-dark button--skip">Skip to main content</a>

    <div class="container container--header">
        <a href="$baseURL" class="logo" aria-label="Home">
            <img src="$resourceURL('themes/startup/images/logo--white.svg')" width="117" height="22" alt="">
        </a>

        <%-- Desktop menu --%>
        <nav class="nav nav--desktop" aria-label="Main">
            <ul class="menu">
                <% loop $Menu(1) %>
                    <li class="menu__item<% if $Children %> menu__item--has-submenu<% end_if %>">
                        <a href="$Link" class="menu__link menu__link--{$LinkingMode}">$MenuTitle</a>
                        <% if $Children %>
                            <ul class="submenu">
                                <% loop $Children %>
                                    <li class="submenu__item">
                                        <a href="$Link" class="submenu__link submenu__link--{$LinkingMode}">$MenuTitle</a>
                                    </li>
                                <% end_loop %>
                            </ul>
                        <% end_if %>
                    </li>
                <% end_loop %>
            </ul>
        </nav>

        <%-- Mobile menu controls --%>
        <button class="hamburger" type="button" aria-label="Toggle menu" data-toggle-mobile-menu>
            <span class="hamburger__lines"></span>
        </button>

        <%-- Mobile menu background - can be clicked to close menu --%>
        <div class="modal__background" data-toggle-mobile-menu></div>

        <%-- Mobile menu --%>
        <nav class="nav nav--mobile" aria-label="Main">
            <a href="$BaseHref" class="logo logo--mobile">
                <img class="logo__image" src="$resourceURL('themes/startup/images/logo--black.svg')" width="117" height="22" alt="{$SiteConfig.Title}">
            </a>
            <ul class="mobile-menu" data-accordion>
                <% loop $Menu(1) %>
                    <li class="mobile-menu__item<% if $Children %> mobile-menu__item--has-submenu<% end_if %>" <% if $Children %>data-accordion-item<% end_if %>>
                        <a href="$Link" id="{$URLSegment}-submenu-link" class="mobile-menu__link"
                        >$MenuTitle</a>
                        <% if $Children %>
                            <button class="submenu-chevron" type="button" aria-label="Open $MenuTitle submenu" aria-expanded="false" aria-controls="{$URLSegment}-submenu" data-accordion-link>
                                <svg width="11" height="8" viewBox="0 0 11 8" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                    <path d="M0 1.88973L1.29663 0.5L5.50183 5.08612L9.70337 0.5L11 1.88973L5.50183 7.86607L0 1.88973Z" fill="#2D2828B3"/>
                                </svg>
                            </button>
                            <div id="{$URLSegment}-submenu" class="mobile-submenu-container" aria-labelledby="{$URLSegment}-submenu-link">
                                <ul class="mobile-submenu">
                                    <% loop $Children %>
                                        <li class="mobile-submenu__item">
                                            <a href="$Link" title="$Title" class="mobile-submenu__link">$MenuTitle</a>
                                        </li>
                                    <% end_loop %>
                                </ul>
                            </div>
                        <% end_if %>
                    </li>
                <% end_loop %>
            </ul>
        </nav>
    </div>
</header>
