<header>
    <div class="container container--header">
        <a href="$BaseHref" class="logo">
            <img src="$resourceURL('themes/startup/images/logo--white.svg')" alt="{$SiteConfig.Title}">
        </a>
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
        <button class="header__button header__button--menu"
            type="button"
            aria-label="Open menu">
            <span class="hamburger">
                <span class="hamburger__inner"></span>
                <span class="hamburger__inner"></span>
                <span class="hamburger__inner"></span>
            </span>
        </button>
    </div>
</header>
