<footer class="footer">
    <div class="container container--footer">
        <div class="copyright">
            &copy; $CurrentDatetime.Format("y") $SiteConfig.Title
        </div>
        <nav class="nav nav--footer">
            <ul class="footer-menu">
                <% loop $Menu(1) %>
                    <li class="footer-menu__item">
                        <a href="$Link" class="footer-menu__link">$MenuTitle</a>
                    </li>
                <% end_loop %>
            </ul>
        </nav>
        <a href="$baseURL" class="footer__logo">
            <img src="$resourceURL('themes/startup/images/logo--white.svg')" alt="{$SiteConfig.Title}">
        </a>
    </div>
</footer>
