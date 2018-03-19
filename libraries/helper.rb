module RS
  module Helpers
    def ffmpeg?
      File.exist?('/usr/bin/ffmpeg')
    end
  end
end

Chef::Recipe.include(RS::Helpers)
