<aside class="page-menu">
    <nav class="page-menu__nav" aria-labelledby="page-menu-heading">
        <h2 id="page-menu-heading" class="h5 page-menu__heading">
            <a href="$Parent.Link" class="page-menu__heading-link">$Parent.Title</a>
        </h2>
        <ul class="page-menu__list">
        <% loop $Menu($PageLevel) %>
            <% if $isCurrent %>
                <li class="page-menu__list-item page-menu__list-item--current">
                    $Title
                    <% if $Children %>
                        <ul>
                            <% loop $Children %>
                                <li class="page-menu__list-item page-menu__list-item--child"><a href="$Link">$Title</a></li>
                            <% end_loop %>
                        </ul>
                    <% end_if %>
                </li>
            <% else %>
                <li class="page-menu__list-item"><a href="$Link">$Title</a></li>
            <% end_if %>
        <% end_loop %>
        </ul>
    </nav>
</aside>
