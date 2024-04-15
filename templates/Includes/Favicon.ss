<% if $SiteConfig.FavIcon %>
  <link rel="shortcut icon" href="$SiteConfig.FavIcon.Link" />
<% else %>
  <link rel="shortcut icon" href="$resourceURL('themes/startup/images/favicon/favicon.ico')" />
<% end_if %>
