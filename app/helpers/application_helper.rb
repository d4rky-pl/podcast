module ApplicationHelper
  def application_title
    'Nerdblog.pl Podcast' + ((@title.present? && " - #{@title}") || '')
  end
end
