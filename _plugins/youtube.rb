class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/
  
  def initialize(tagName, markup, tokens)
    super
    
    if markup =~ Syntax then
      @id = $1
      
      if $2.nil? then
        @width = "80%"
        @height = "300"
      else
        @width = $2.to_i
        @height = $3.to_i
      end
    else
      raise "No YouTube ID provided in the \"youtube\" tag"
    end
  end
  
  def render(context)
    "<div class=\"youtube\"><center><iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://www.youtube.com/embed/#{@id}\" frameborder=\"0\">        </iframe></center></div>"
  end
  
  Liquid::Template.register_tag "youtube", self
end
