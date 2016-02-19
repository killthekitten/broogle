module ApplicationHelper
  def highlighted_text(text, highlights)
    boundary = "(?![-_\b])"
    words = highlights.uniq.sort_by(&:length).reverse
    regex = Regexp.new words.map { |highlight| "#{boundary}#{Regexp.escape(highlight)}#{boundary}" }.join("|")
    highlight text, regex
  end
end
