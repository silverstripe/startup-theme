<header>
    <div class="container container--header">
        <a href="$BaseHref" class="logo">
            <img src="$resourceURL('themes/startup/images/logo--white.svg')" alt="{$SiteConfig.Title}">
        </a>

        <%-- Desktop menu --%>
        <nav>
            <ul class="menu">
                <% loop $Menu(1) %>
                    <li class="menu__item<% if $Children %> menu__item--has-submenu<% end_if %>">
                        <a href="$Link">$MenuTitle</a>
                        <% if $Children %>
                            <ul class="submenu">
                                <% loop $Children %>
                                    <li class="submenu__item">
                                        <a href="$Link" title="$Title">$MenuTitle</a>
                                    </li>
                                <% end_loop %>
                            </ul>
                        <% end_if %>
                    </li>
                <% end_loop %>
            </ul>
        </nav>

        <%-- Mobile menu controls --%>
        <input class="mobile-menu__toggle" type="checkbox" id="mobile-menu__toggle">
        <label class="hamburger" for="mobile-menu__toggle" aria-label="Open menu">
            <span class="hamburger__lines"></span>
        </label>

        <%-- Mobile menu background - can be clicked to close menu --%>
        <label class="modal__background" for="mobile-menu__toggle" aria-hidden="true"></label>

        <%-- Mobile menu --%>
        <nav class="nav nav--mobile">
            <a href="$BaseHref" class="logo">
                <img src="$resourceURL('themes/startup/images/logo--black.svg')" alt="{$SiteConfig.Title}">
            </a>
            <ul class="mobile-menu">
                <% loop $Menu(1) %>
                    <li class="mobile-menu__item<% if $Children %> mobile-menu__item--has-submenu<% end_if %>">
                        <a href="$Link">$MenuTitle</a>
                        <% if $Children %>
                            <input class="mobile-submenu__toggle" type="checkbox" id="{$URLSegment}-submenu__toggle">
                            <label class="submenu-chevron" for="{$URLSegment}-submenu__toggle" aria-label="Open $MenuTitle submenu">
                                <svg width="11" height="8" viewBox="0 0 11 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M0 1.88973L1.29663 0.5L5.50183 5.08612L9.70337 0.5L11 1.88973L5.50183 7.86607L0 1.88973Z" fill="#2D282870"/>
                                    </svg>
                            </label>
                            <div class="mobile-submenu-container">
                                <ul class="mobile-submenu">
                                    <% loop $Children %>
                                        <li class="mobile-submenu__item">
                                            <a href="$Link" title="$Title">$MenuTitle</a>
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
