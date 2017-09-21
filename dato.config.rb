# index page
create_post "index.md" do
    frontmatter :yaml, {
      layout: "default",
    }
    content dato.index_page.content
end
