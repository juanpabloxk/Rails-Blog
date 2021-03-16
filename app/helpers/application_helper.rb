module ApplicationHelper
  def markdown_to_html(text)
    MarkdownConstants::MD_TO_HTML.render(text).html_safe
  end

  def markdown_to_plain(code)
    MarkdownConstants::MD_TO_PLAIN.render(code)
  end
end
