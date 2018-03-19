#
# Cookbook:: ffmpeg
# Recipe:: default
#
# Copyright:: 2018, Nghiem Ba Hieu, All Rights Reserved.
return if ffmpeg?

remote_file "#{Chef::Config[:file_cache_path]}/ffmpeg-git-64bit-static.tar.xz" do
  source node['ffmpeg']['url']
  mode 0o644
  action :create_if_missing
end

# ffserver removed by Mar 14, 2018
execute 'Install ffmpeg' do
  cwd Chef::Config[:file_cache_path]
  command 'tar xf ffmpeg-git-64bit-static.tar.xz && cd ffmpeg* && mv -t /usr/bin ffmpeg ffmpeg-10bit ffprobe qt-faststart'
end

node['ffmpeg']['binaries'].each do |ffmpeg_binary|
  file "/usr/bin/#{ffmpeg_binary}" do
    mode 0o755
    owner 'root'
    group 'root'
  end
end
