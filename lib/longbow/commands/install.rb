$:.push File.expand_path('../../', __FILE__)
require 'fileutils'
require 'longbow'

command :install do |c|
  c.syntax = 'longbow install [options]'
  c.summary = 'Creates the required files in your directory.'
  c.description = ''
  c.option '-d', '--directory DIRECTORY', 'Path where the .xcproj or .xcworkspace file && the .longbow.json file live.'

  c.action do |args, options|
    @directory = options.directory ? options.directory : Dir.pwd
    @json_path = @directory + '/.longbow.json'

    if File.exist?(@json_path)
      Longbow::red '  .longbow.json already exists at ' + @json_path
    else
      File.open(@directory + '/.longbow.json', 'w') do |f|
        f.write('{
	"targets":[
		{
			"name":"TargetName",
			"icon_url":"https://somewhere.net/img.png",
			"info_plist": {
        		"CFBundleId":"com.company.target"
      		}
		},
		{
			"name":"Target2",
			"icon_path":"/relative/path/to/file.png",
			"info_plist": {
        		"CFBundleId":"com.company.target"
      		}
		}
	],
 	"global_info_keys":{
 		"somekey":"somevalue"
 	}
}')
      end
      Longbow::green '  .longbow.json created'
    end
  end
end