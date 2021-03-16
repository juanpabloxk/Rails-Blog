require 'redcarpet'
require 'redcarpet/render_strip'

module MarkdownConstants
  MD_TO_PLAIN = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
  MD_TO_HTML = Redcarpet::Markdown.new(Redcarpet::Render::HTML, 
    extensions = {
      hard_wrap: true,
      prettify: true,
      tables:true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true,
      superscript: true
  })
end
