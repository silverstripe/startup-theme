<% if $Pages %>
    <nav class="breadcrumbs">
        <ol><% loop $Pages %><% if not $IsLast %><% if not $Up.Unlinked %><li><a href="$Link" class="breadcrumb"><% end_if %>$MenuTitle.XML<% if not Up.Unlinked %></a></li><% end_if %> <span class="breadcrumb__delimiter" aria-hidden="true">/</span><% end_if %><% end_loop %></ol>
    </nav>
<% end_if %>
