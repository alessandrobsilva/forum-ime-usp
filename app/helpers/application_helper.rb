module ApplicationHelper

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code,language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, :hard_wrap => true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

  # Retorna a data padronizada no formato brasileiro
  # I18n não ficou legal...
  def date d
    "#{digit(d.day)}/#{digit(d.mon)}/#{d.year} - #{digit(d.hour)}:#{digit(d.min)}:#{digit(d.sec)}"
  end

  # Retorna uma string representando o inteiro d
  def digit d
    if d < 10
      "0#{d}"
    else
      "#{d}"
    end
  end

end
