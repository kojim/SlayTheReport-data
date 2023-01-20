require 'json'

next_token = nil
begin
  p 'runnning...'
  if next_token == nil
    scan_out =JSON `aws dynamodb scan --table-name SlayTheReport-v3p --max-items 100`
  else
    scan_out =JSON `aws dynamodb scan --table-name SlayTheReport-v3p --max-items 100 --starting-token #{next_token}`
  end
  scan_out['Items'].each{|data|
    filename = data['runid']['S']
    next_token = scan_out['NextToken']
    File.open("data/#{filename}", 'w') {|f|
      f.write(data)
    }
  }
end while next_token != nil
