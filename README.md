# startup-theme

The default theme for Silverstripe CMS. Startup has been designed to be quickly customisable and extendable so that you 
can spend minimal time on boilerplate code and more time building your application. Startup is also intended to be a 
demonstrative tool for Silverstripe beginners to get a feel for how the framework operates.

In-depth documentation on Silverstripe themes can be [found here](https://docs.silverstripe.org/en/5/developer_guides/templates/themes/).

--------

## Templates

Silverstripe templates are held in .ss files which are similar to .html files, with the difference that .ss files 
contain Silverstripe template variables for rendering content from the database.

Full template documentation can be [found here](https://docs.silverstripe.org/en/5/developer_guides/templates/). A
particularly useful article is the one detailing [template syntax](https://docs.silverstripe.org/en/5/developer_guides/templates/syntax/) -
this contains everything you need to know to quickly become a template adept!

### A quick walkthrough of the template files in this theme

Startup comes with the necessary templates out of the box to render pages with a header and a footer, as well as a menu 
for desktop and mobile view ports. A list of the template files and their paths and functions:

* templates/Page.ss - This is the top level page template, with all other templates being rendered within this one. It 
serves as the root HTML for all pages of your site, and therefore is where you place the `<head>` and `<body>` tags.
* templates/Layout/Page.ss - When a template is nested within a `Layout` folder, this template will be rendered by the 
`$Layout` variable in the classes' primary template. An example in this theme: templates/Page.ss calls `$Layout`. This 
is particularly useful when creating custom page types which subclass Page.php. A common pattern is to subclass Page 
(e.g. new page class is App\Pages\MyCustomPage) then add a Layout template (e.g. nest the page template in
templates/App/Pages/MyCustomPage/Layout/MyCustomPage.ss). As this class is a subclass of Page, it will inherit the top 
level Page.ss template and this will render the class specific `$Layout` - thus ensuring your site has a global header 
and footer and other markup which is needed for every page. Silverstripe template inheritance is deep and powerful, and 
is explained in much greater detail in [this lesson](https://www.silverstripe.org/learn/lessons/v4/working-with-multiple-templates-1).
* templates/Includes - Template files included in this folder can be easily included in any other template by using
`<% include TemplateName %>`. In this theme we include the Header and Footer, as well as the suite of Favicons for the
purposes of tidier markup.

## Styles and JS

All of the CSS in this theme is *Native CSS*. This means there are no cumbersome build tasks or transpiling SASS. Just
add to and edit the files, and you can modify the theme as needed. The file css/startup.css handles the importing of all
other files so be sure to add any extra css files you may need here. The top level Page.ss includes this file by way of
the [Silverstripe Requirements API](https://docs.silverstripe.org/en/5/developer_guides/templates/requirements/).

The theme Javascript is included in much the same way. js/startup.js imports modularised functionality, and this is then
included in the top level Page.ss template.

--------

## startup-theme-components

This theme is extended upon by the [startup-theme-components module](https://github.com/silverstripeltd/startup-theme-components).
The module adds some commonly used modules to the CMS, and extends and expands upon the CSS in this module. It is highly
recommended to install the module with this theme!
