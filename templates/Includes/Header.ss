<header>
    <div class="container header__container">
        <a href="$BaseHref" class="logo">
            <img src="$resourceURL('themes/startup/images/logo--white.svg')" alt="{$SiteConfig.Title}">
        </a>
        <nav>
            <ul class="menu">
                <% loop $Menu(1) %>
                    <li class="menu__item<% if $Children %> menu__item--has-subnav<% end_if %>">
                        <a href="$Link">$MenuTitle</a>
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
