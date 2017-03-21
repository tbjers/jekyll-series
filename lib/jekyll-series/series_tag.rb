module Jekyll
  module Series
    class SeriesTag < Liquid::Tag
      def initialize(tag_name, params, token)
        super
      end

      def render(context)
        page_data = context.environments.first["page"]
        return "<!-- problem with series tag -->" unless sane_page_data? page_data
        render_html page_data, context.registers[:site].posts.docs.select { |p| p.data["series"] == page_data["series"] }
      end

      def render_html(page_data, all_entries)
        list = "<ul class='jekyll-series'>"
        all_entries.each_with_index do |post|
          list += generate_title page_data, post
        end
        text + list + "</ul>"
      end

      def sane_page_data?(page_data)
        return false unless sane_series_name? page_data
        return false unless sane_series_description? page_data
        true
      end

      def sane_series_name?(page_data)
        return false unless page_data["series"]
        true
      end

      def sane_series_description?(page_data)
        return false unless page_data["series_description"]
        true
      end

      def generate_title(page_data, post)
        extra = " class='active'" if post.data["title"] == page_data["title"]
        "<li#{extra}><a href='#{post.url}/'>#{post.data['title']}</a></li>"
      end
    end
  end
end

Liquid::Template.register_tag("series", Jekyll::Series::SeriesTag)
