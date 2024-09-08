<% if $Pages %>
    <span class="breadcrumbs">
        <% loop $Pages %><% if not $IsLast %><% if not $Up.Unlinked %><a href="$Link" class="breadcrumb"><% end_if %>$MenuTitle.XML<% if not Up.Unlinked %></a><% end_if %> <span class="breadcrumb__delimiter">/</span><% end_if %><% end_loop %>
    </span>
<% end_if %>
