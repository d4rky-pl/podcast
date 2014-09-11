class Template::Render
  def initialize(layout=:default)
    @layout = layout
  end

  def render(page, data={})
    page = page.to_s
    data = Hashie::Mash.new data
    data.config = config

    page_class = "Template::Context::#{page.camelize}".constantize
    page_class_instance = page_class.new data
    page_class_instance.template_file = Rails.root.join('templates', "#{@layout}.mustache").to_s
    page_class_instance.render
  end

  def config
    @config ||= YAML.load_file(Rails.root.join('config','podcast.yml'))[Rails.env]
  end
end
