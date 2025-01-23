Jekyll::Hooks.register :documents, :pre_render do |doc|
    doc.content.gsub!(/\[\[(.*?)\]\]/) do
      link_text = $1
      if link_text.include?('|')
        parts = link_text.split('|')
        "[#{parts[1]}](#{parts[0]}.md)"
      else
        "[#{link_text}](#{link_text}.md)"
      end
    end
  end
  