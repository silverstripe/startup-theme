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

        <%-- Mobile menu background --%>
        <div class="modal__background"></div>

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
                            <ul class="mobile-submenu">
                                <% loop $Children %>
                                    <li class="mobile-submenu__item">
                                        <a href="$Link" title="$Title">$MenuTitle</a>
                                    </li>
                                <% end_loop %>
                            </ul>
                        <% end_if %>
                    </li>
                <% end_loop %>
            </ul>
        </nav>
    </div>
</header>
