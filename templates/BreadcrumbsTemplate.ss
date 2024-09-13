<nav class="breadcrumbs">
    <ol class="breadcrumbs__list">
        <li class="breadcrumbs__list-item">
            <a href="$baseURL">Home</a>
            <span class="breadcrumbs__list-delimiter" aria-hidden="true">/</span>
        </li>
        <% if $Pages %>
            <% loop $Pages %>
                <% if not $IsLast %>
                    <li class="breadcrumbs__list-item">
                        <% if not $Up.Unlinked %><a href="$Link"><% end_if %>$MenuTitle.XML<% if not Up.Unlinked %></a><% end_if %>
                        <span class="breadcrumbs__list-delimiter" aria-hidden="true">/</span>
                    </li>
                <% end_if %>
            <% end_loop %>
        <% end_if %>
    </ol>
</nav>
