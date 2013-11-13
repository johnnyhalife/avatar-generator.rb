require 'sinatra'
require 'RMagick'
require 'rvg/rvg'
require 'redcarpet'

get '/' do
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)  
  markdown.render(File.read('./README.md'))
end

# matches up-to /{0:size}/{2:background}/{3:foreground}.{4:format}
get /([^\/]+)(\/([^\/]+)\/([^\/]+))?\.(\w+)/ do |size, _, background, foreground, format|
  cache_control :public, :max_age => 36000
  
  content_type "image/#{format}"
  opts = { :full_mode => params[:mode] == 'full' }
  to_image(size, background, foreground, format, params[:text], opts)
end

# matches up-to /{0:size}/{2:background}/{3:foreground}
get /([^\/]+)(\/([^\/]+)\/([^\/]+))?/ do |size, _, background, foreground|
  cache_control :public, :max_age => 36000

  content_type "image/png"
  opts = { :full_mode => params[:mode] == 'full' }
  to_image(size, background, foreground, 'png', params[:text], opts)
end

def to_image(size, background, foreground, format = 'png', text = nil, opts = {})
  # defaults
  background = background ? "##{background}" : 'black'
  foreground = foreground ? "##{foreground}" : 'grey69'

  if (text && !opts[:full_mode]) then 
    text = text.split(/\s/).map { |t| t[0].upcase }.slice(0, 3).join('')
  end
  
  w, h = size.split('x').map { |d| d.to_i }
  h ||= w

  text ||= "#{w}x#{h}"

  rvg = Magick::RVG.new(w, h).viewbox(0, 0, w, h) do |canvas|
    canvas.background_fill = background
  end

  img = rvg.draw
  img.format = format

  drawable = Magick::Draw.new
  drawable.pointsize = w / text.length
  drawable.font = ("./DroidSans.ttf")
  drawable.fill = foreground
  drawable.gravity = Magick::CenterGravity
  drawable.annotate(img, 0, 0, 0, 0, text)

  return img.to_blob
end