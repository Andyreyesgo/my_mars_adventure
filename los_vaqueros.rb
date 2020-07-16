require "uri"
require "net/http"
require "JSON"
def request(url_in, my_key)

    url = URI("#{url_in}&api_key=""#{my_key}")
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    a=[]
    response = https.request(request)
    data= JSON.parse(response.read_body)
    pictures=data['photos']

    output = "<html>\n<head>\n</head>\n \t<body>\n\t\t <ul>"
    
    pictures.each do |em|
        output += "\n \t\t<li><img src=\"#{em["img_src"]}\"/></li>"
        end
        output+= "\n\t\t</ul>\n\t</body>\n</html>"
        File.write('mars_rover.html', output)
    end

    body= request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10" ,"wLhsWbAqvYgtS0NlMsjYtTNJ20ac3IJ9gFAJKI5d")