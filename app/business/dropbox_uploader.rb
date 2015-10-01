require 'dropbox_sdk'

class DropboxUploader
  def initialize(access_token)
    @access_token = access_token
  end

  def generate_access_token
    flow = DropboxOAuth2FlowNoRedirect.new(ENV['DROPBOX_APP_KEY'], ENV['DROPBOX_APP_SECRET'])
    authorize_url = flow.start

    # Have the user sign in and authorize this app
    puts '1. Go to: ' + authorize_url
    puts '2. Click "Allow" (you might have to log in first)'
    puts '3. Copy the authorization code'
    print 'Enter the authorization code here: '
    code = gets.strip

    # This will fail if the user gave us an invalid authorization code
    flow.finish(code)
  end

  def upload_file(file_path, file_name)
    client = DropboxClient.new(@access_token)
    puts "linked account:", client.account_info.inspect

    response = client.put_file("teste-personalidade/#{file_name}", open(file_path))
    puts "uploaded:", response.inspect
  end
end
