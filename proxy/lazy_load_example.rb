# ThirdPartyYouTubeLib is the interface that the service should implement
module ThirdPartyYouTubeLib
  def list_videos
    raise NotImplementedError, "Method list_videos must be implemented"
  end

  def get_video_info(id)
    raise NotImplementedError, "Method get_video_info must be implemented"
  end

  def download_video(id)
    raise NotImplementedError, "Method download_video must be implemented"
  end
end

# ThirdPartyYouTubeClass is the service class implementing the ThirdPartyYouTubeLib interface
class ThirdPartyYouTubeClass
  include ThirdPartyYouTubeLib

  def list_videos
    # Get a list of videos using the YouTube API
  end

  def get_video_info(id)
    # Get detailed information for a video
  end

  def download_video(id)
    # Download video from YouTube
  end
end

# CachedYouTubeClass is a wrapper that caches the results of the service class
class CachedYouTubeClass
  include ThirdPartyYouTubeLib

  def initialize(service)
    @service = service
    @list_cache = nil
    @video_cache = nil
    @need_reset = false
  end

  def list_videos
    if @list_cache.nil? || @need_reset
      @list_cache = @service.list_videos
    end
    @list_cache
  end

  def get_video_info(id)
    if @video_cache.nil? || @need_reset
      @video_cache = @service.get_video_info(id)
    end
    @video_cache
  end

  def download_video(id)
    if !download_exists(id) || @need_reset
      @service.download_video(id)
    end
  end

  private

  def download_exists(id)
    # Check if video is already downloaded
    false
  end
end

# YouTubeManager is the GUI class that uses the service
class YouTubeManager
  def initialize(service)
    @service = service
  end

  def render_video_page(id)
    info = @service.get_video_info(id)
    # Render video page
  end

  def render_list_panel
    list = @service.list_videos
    # Render list panel
  end
end
