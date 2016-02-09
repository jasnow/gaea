shared_context 'questions list' do
  before do
    stub_request(:get, "http://api.stackexchange.com/2.2/search/advanced?accepted=true&pagesize=10&q=something%20missing&site=stackoverflow").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: File.open(File.dirname(__FILE__) + '/fixtures/' + 'questions.json', 'rb').read, headers: {})

    stub_request(:get, "http://api.stackexchange.com/2.2/search/advanced?accepted=true&pagesize=10&q=something%20right&site=stackoverflow").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 400, body: File.open(File.dirname(__FILE__) + '/fixtures/' + 'bad_request.json', 'rb').read, headers: {})
  end
end