module ApplicationHelper
  def highlighted_text(text, highlights)
    boundary = "(?![-_\\b])"
    words = highlights.uniq.map { |highlight| Regexp.escape(highlight) }.join("|")
    regex = /#{boundary}(#{words})#{boundary}/
    highlight text, regex
  end
end
