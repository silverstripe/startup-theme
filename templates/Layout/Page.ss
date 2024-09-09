<main class="container container--page">
    <% if $PageLevel > 1 %>
        $Breadcrumbs
    <% end_if %>
    <div class="page">
        <div class="page__content">
            <h1 class="page__title">$Title</h1>
            $Content
        </div>
        <% if $Menu($PageLevel).count > 1 && $PageLevel > 1 %>
            <aside class="page-menu">
                <h2 class="h5 page-menu__heading">$Title</h2>
                <nav class="page-menu__nav">
                    <ul class="page-menu__list">
                    <% loop $Menu($PageLevel) %>
                        <% if $isCurrent %>
                            <li class="page-menu__list-item page-menu__list-item--current">$Title</li>
                        <% else %>
                            <li class="page-menu__list-item"><a href="$Link">$Title</a></li>
                        <% end_if %>
                    <% end_loop %>
                    </ul>
                </nav>
            </aside>
        <% end_if %>
    </div>
</main>
