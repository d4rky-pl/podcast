class Template::Context < Mustache
  include ::Template::Helpers

  def initialize(data)
    @data = data
  end

  protected
  def with_markup(text)
    # TODO: more than one markup support
    GitHub::Markup.render('.md', text.to_s)
  end
end