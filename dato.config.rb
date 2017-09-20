require "i18n/backend/fallbacks"

#posts
directory "_posts" do
   I18n.available_locales.each do |locale| # iterate over all the administrative area languages
     I18n.with_locale(locale) do    # switch to the nth locale

      dato.posts.each do |post|
        create_post "#{post.date.to_s.parameterize}-#{post.title.parameterize}.md" do
          frontmatter :yaml, {
            lang: "#{locale}",
            layout: "post",
            ref: post.ref,
            title: post.title,
            date: post.date.to_s,
            categories: post.categories,
            img: moment.img_featured
          }
          content post.content
        end
      end

    end
  end
end

#drafts
directory "_drafts" do

  dato.drafts.each do |draft|
    create_post "#{draft.title.parameterize}-draft.md" do
      frontmatter :yaml, {
        title: draft.title,
      }
      content draft.content
    end
  end

end


I18n.available_locales.each do |locale| # iterate over all the administrative area languages
  I18n.with_locale(locale) do    # switch to the nth locale

      # home_page
      create_post "index-#{locale}.md" do
        frontmatter :yaml, {
          layout: 'home_page',
          lang: "#{locale}",
          ref: "index",
          permalink: dato.home_page.permalink
        }
        content dato.home_page.content
      end

      # about_page
      create_post "about-#{locale}.md" do
        frontmatter :yaml, {
          layout: 'page_simple',
          ref: 'about',
          lang: "#{locale}",
          title: dato.about_page.title,
          permalink: dato.about_page.permalink
        }
        content dato.about_page.bio
      end

      # #project_page
      # create_post "projects-#{locale}.md" do
      #   frontmatter :yaml, {
      #     layout: "projects_page",
      #     lang: "#{locale}",
      #     ref: "projects",
      #     title: dato.project_page.title,
      #     permalink: dato.project_page.permalink
      #   }
      #   content dato.project_page.content
      # end

      #lab_page
      create_post "labs-#{locale}.md" do
        frontmatter :yaml, {
          layout: "projects_page",
          lang: "#{locale}",
          ref: "labs",
          title: dato.lab_page.title,
          description: dato.lab_page.description,
          permalink: dato.lab_page.permalink
        }
        content dato.lab_page.content
      end

      # blog_page
      create_post "blog-#{locale}.md" do
        frontmatter :yaml, {
          layout: "page",
          ref: 'blog',
          lang: "#{locale}",
          title: dato.blog_page.title,
          permalink: dato.blog_page.permalink
        }
        content dato.blog_page.content
      end

      #journey_page
      create_post "journey-#{locale}.md" do
        frontmatter :yaml, {
          layout: "page",
          ref: 'journey',
          lang: "#{locale}",
          title: dato.journey_page.title,
          description: dato.journey_page.description,
          permalink: dato.journey_page.permalink
        }
        content dato.journey_page.content
      end

  end
end


## collections
directory "_labs" do

   I18n.available_locales.each do |locale| # iterate over all the administrative area languages
     I18n.with_locale(locale) do  # switch to the nth locale

      dato.labs.each do |lab|
        create_post "#{lab.title.parameterize}-#{locale}.md" do
          frontmatter :yaml, {
            layout: "page_simple",
            lang: "#{locale}",
            ref: lab.ref,
            title: lab.title,
            img: lab.img_featured,
          }
          content lab.content
        end
      end

    end
  end

end


directory "_moments" do
  I18n.available_locales.each do |locale| # iterate over all the administrative area languages
    I18n.with_locale(locale) do    # switch to the nth locale

      dato.moments.each do |moment|
        create_post "#{moment.date.to_s.parameterize}-#{moment.title.parameterize}.md" do
          frontmatter :yaml, {
            layout: "moments",
            lang: "#{locale}",
            ref: moment.ref,
            title: moment.title,
            date: moment.date.to_s,
            categories: moment.categories,
            img: moment.img_featured,
            description: moment.description,
          }
          content moment.content
        end
      end

    end
  end

end

# directory "_projects" do
#   I18n.available_locales.each do |locale| # iterate over all the administrative area languages
#     I18n.with_locale(locale) do    # switch to the nth locale

#       dato.projects.each do |project|
#         create_post "#{project.title.parameterize}.md" do
#           frontmatter :yaml, {
#             layout: "page_simple",
#             lang: "#{locale}",
#             ref: project.ref,
#             title: project.title,
#             img: project.img_featured
#           }
#           content project.content
#         end
#       end

#     end
#   end

# end
