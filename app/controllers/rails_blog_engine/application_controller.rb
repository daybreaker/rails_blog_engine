module RailsBlogEngine
  class ApplicationController < ActionController::Base
    layout :choose_layout

    helper_method :post_permalink_url
    helper_method :post_permalink_path

    protected

    # Construct a CanCan Ability object to control access to the blog.
    def current_ability
      method = Rails.configuration.rails_blog_engine.current_user_method
      if respond_to?(method)
        user = send(method)
      else
        raise "You must define #{method} on RailsBlogEngine::ApplicationController, as described in README.md"
      end
      RailsBlogEngine::Ability.new(user)
    end

    # We normally use one of our parent application's layouts, so that we
    # "auto-blend" into the existing look-and-feel of the site.  The
    # specific layout is specified by our initializer.
    def choose_layout
      Rails.configuration.rails_blog_engine.layout
    end

    def post_permalink_local_path(post)
      date = post.published_at.utc
      sprintf('%04d/%02d/%02d/%s', date.year, date.month,
              date.day, post.permalink)
    end

    def post_permalink_path(post)
      blog_path + post_permalink_local_path(post)
    end

    def post_permalink_url(post)
      blog_url + post_permalink_local_path(post)
    end
  end
end
