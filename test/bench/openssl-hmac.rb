require 'benchmark'
require 'openssl'

KEY="some secret key"
TXT=%{Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.}

Benchmark.bm do |x|
  x.report("openssl-hmac-sha1") do 
    100000.times do |i| 
      OpenSSL::HMAC.digest('sha1', KEY, TXT)
    end
  end
end             

