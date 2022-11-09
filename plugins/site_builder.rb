class SiteBuilder < Bridgetown::Builder
  # write builders which subclass SiteBuilder in plugins/builders
end

class Builders::Filters < SiteBuilder
  def build
    liquid_filter :tag_badge do |tag|
      tag_color = color_from_string(tag)
      tag_text = contrasting_text_color(tag_color)
      "<span class='tag-badge' style='background-color: #{tag_color}; color: #{tag_text};'>#{tag}</span>"
    end
  end
end

def darken_color(hex_color, amount=0.4)
  hex_color = hex_color.gsub('#','')
  rgb = hex_color.scan(/../).map {|color| color.hex}
  rgb[0] = (rgb[0].to_i * amount).round
  rgb[1] = (rgb[1].to_i * amount).round
  rgb[2] = (rgb[2].to_i * amount).round
  "#%02x%02x%02x" % rgb
end
  
def lighten_color(hex_color, amount=0.6)
  hex_color = hex_color.gsub('#','')
  rgb = hex_color.scan(/../).map {|color| color.hex}
  rgb[0] = [(rgb[0].to_i + 255 * amount).round, 255].min
  rgb[1] = [(rgb[1].to_i + 255 * amount).round, 255].min
  rgb[2] = [(rgb[2].to_i + 255 * amount).round, 255].min
  "#%02x%02x%02x" % rgb
end

def color_from_string(string)
  "##{Digest::MD5.hexdigest(string)[0..5]}"
end

def contrasting_text_color(hex_color)
  color = hex_color.gsub('#','')
  convert_to_brightness_value(color) > 382.5 ? darken_color(color) : lighten_color(color)
end

def convert_to_brightness_value(hex_color)
  (hex_color.scan(/../).map {|color| color.hex}).sum
end
